class UsersController < ApplicationController
  def note
    respond_to do |format|
      @user = User.find(params[:user_id])
      format.js
    end
  end

  def update_note
    user = User.find(params[:user_id])
    user.note = note_params[:note]
    user.save
  end

  private

  def note_params
    params.require(:user).permit(:note)
  end
end
