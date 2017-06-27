class DeleteChannel < ApplicationCable::Channel
  def subscribed
    stream_from "delete_#{params[:raid_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
