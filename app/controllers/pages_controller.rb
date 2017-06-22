class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @upcoming_raids = Raid.where('date > ?', Time.now.in_time_zone("Paris")).order(date: :asc)
    @past_raids = Raid.where('date <= ?', Time.now.in_time_zone("Paris")).order(date: :desc)
  end
end
