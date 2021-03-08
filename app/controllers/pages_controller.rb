class PagesController < ApplicationController
  before_action :set_date

  def home
    @events = Event.today_events(@start_date).order(:started_at)
  end

  def about
    @events = Event.today_events(@start_date)
  end

  def contact
  end

  private

  def set_date
    @start_date = params.fetch(:start_date, Date.today).to_date
  end
end
