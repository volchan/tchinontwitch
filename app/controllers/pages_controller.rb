class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @upcoming_raids = Raid.where('date > ?', Time.now).order(date: :asc)
    @past_raids = Raid.where('date <= ?', Time.now).order(date: :desc)
  end
end
