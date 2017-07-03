class TagsController < ApplicationController
  before_action :find_raid, only: %i[new create]
  before_action :find_tag, only: %i[update destroy show_note]

  def new
    authorize @tag = Tag.new
  end

  def create
    authorize @tag = Tag.new(toon: Toon.find(tag_params[:toon_id]), note: tag_params[:note], raid: @raid)
    @tag.validate_user = true
    if @tag.save
      redirect_to @raid
    else
      render :new
    end
  end

  def update
    @tag.validate_user = false
    @tag.status = params[:status].to_i
    @tag.save
  end

  def destroy
    @tag.validate_user = false
    @tag.destroy
  end

  def show_note
    respond_to :js
  end

  def delete_tag
    skip_authorization
    respond_to do |format|
      @deleted_tag = params[:tag_id]
      @raid = Raid.find(params[:raid_id])
      format.js
    end
  end

  private

  def find_raid
    @raid = Raid.find(params[:raid_id])
  end

  def find_tag
    authorize @tag = Tag.find(params[:id] || params[:tag_id])
  end

  def tag_params
    params.require(:tag).permit(:toon_id, :note)
  end
end
