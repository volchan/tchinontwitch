class CardChannel < ApplicationCable::Channel
  def subscribed
    stream_from "card_#{params[:raid_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
