class TagsController < ApplicationController
  before_action :find_raid, only: %i[new create]
  before_action :find_tag, only: %i[update destroy]

  def new
    @tag = Tag.new
    @toons = Toon.where(user: current_user).order(name: :asc)
  end

  def create
    @tag = Tag.new(
      toon: Toon.find(tag_params[:toon_id]),
      raid: @raid
    )
    if @tag.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @tag.status = params[:status]
    @tag.save
    @raid = @tag.raid
    redirect_to @raid
  end

  def destroy
    @raid = @tag.raid
    @tag.destroy
    redirect_to @raid
  end

  private

  def find_raid
    @raid = Raid.find(params[:raid_id])
  end

  def find_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:toon_id)
  end
end