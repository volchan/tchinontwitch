class CardChannel < ApplicationCable::Channel
  def subscribed
    stream_from "roster_#{params[:raid_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
