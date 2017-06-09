class RaidsController < ApplicationController
  before_action :find_raid, only: %i[show destroy]

  def index; end

  def show; end

  def new
    @raid = Raid.new
    @dungeons = Dungeon.all.order(name: :asc)
  end

  def create
    dungeon = Dungeon.find(raid_params[:dungeon]) unless raid_params[:dungeon] == ''
    raid_infos = {}
    raid_infos[:dungeon] = dungeon
    raid_infos[:difficulty] = raid_params[:difficulty].to_i
    raid_infos[:date] = Time.parse(raid_params[:date]) unless raid_params[:date] == 'Y/m/d H:i'
    raid_infos[:leader] = current_user
    @raid = Raid.new(raid_infos)
    if @raid.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @raid.destroy
    redirect_to root_path
  end

  private

  def find_raid
    @raid = Raid.find(params[:id])
  end

  def raid_params
    params.require(:raid).permit(:dungeon, :difficulty, :date)
  end
end
