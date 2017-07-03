class UsersController < ApplicationController
  def note
    respond_to do |format|
      authorize @user = User.find(params[:user_id])
      format.js
    end
  end

  def update_note
    authorize user = User.find(params[:user_id])
    user.note = note_params[:note]
    user.save
  end

  private

  def note_params
    params.require(:user).permit(:note)
  end
end
