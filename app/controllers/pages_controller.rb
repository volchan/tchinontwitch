class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @upcoming_raids = Raid.where('date > ?', Time.now.strftime('%Y-%m-%d %H:%M:%S'))
    @past_raids = Raid.where('date <= ?', Time.now.strftime('%Y-%m-%d %H:%M:%S'))
  end
end
