class RaidsController < ApplicationController
  before_action :find_raid, only: %i[show destroy]
  before_action :ajax_find_raid, only: %i[render_cable_card show_roster_list edit_tag]

  skip_before_action :authenticate_user!, only: :render_cable_card

  def index; end

  def show
    tags = @raid.tags
    @pending_tags = tags.where(status: 0)
    accepted_tags = tags.where(status: 1)
    dps = []
    heal = []
    tank = []
    accepted_tags.each do |tag|
      case tag.toon.spec_role
      when 'DPS' then dps << tag
      when 'HEALING' then heal << tag
      when 'TANK' then tank << tag
      end
    end
    @dps_tags = dps
    @heal_tags = heal
    @tank_tags = tank
  end

  def new
    @raid = Raid.new
    @dungeons = Dungeon.all.order(name: :asc)
  end

  def create
    dungeon = Dungeon.find_by(id: raid_params[:dungeon_id])
    leader = Toon.find(raid_params[:leader_id].to_i)
    raid_infos = {}
    raid_infos[:dungeon] = dungeon
    raid_infos[:difficulty] = raid_params[:difficulty].to_i
    raid_infos[:faction] = raid_params[:faction].to_i
    raid_infos[:date] = Time.parse(raid_params[:date]) unless raid_params[:date] == ''
    raid_infos[:leader] = leader
    @raid = Raid.new(raid_infos)
    if @raid.save
      @raid.tags.create(toon: leader, status: 1)
      redirect_to @raid
    else
      render :new
    end
  end

  def destroy
    @raid.destroy
    redirect_to root_path
  end

  def render_cable_card
    respond_to do |format|
      @user = current_user
      format.js
    end
  end

  def show_roster_list
    respond_to do |format|
      roster_tags = @raid.tags.where(status: 1)
      @roster_toons_names = []
      roster_toons = roster_tags.each { |tag| @roster_toons_names << tag.toon.name.downcase + '-' + tag.toon.realm.name.downcase }
      @roster_toons_names
      format.js
    end
  end

  def edit_tag
    respond_to do |format|
      @user = current_user
      @tag = Tag.find(params[:tag_id])
      format.js
    end
  end

  private

  def find_raid
    @raid = Raid.find(params[:id])
  end

  def ajax_find_raid
    @raid = Raid.find(params[:raid_id])
  end

  def raid_params
    params.require(:raid).permit(:dungeon_id, :difficulty, :faction, :date, :leader_id)
  end
end
