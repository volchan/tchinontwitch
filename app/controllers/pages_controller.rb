class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @upcoming_raids = Raid.where('date > ?', Time.now.strftime('%Y-%m-%d %H:%M:%S')).order(date: :asc)
    @past_raids = Raid.where('date <= ?', Time.now.strftime('%Y-%m-%d %H:%M:%S')).order(date: :desc)
  end
end
