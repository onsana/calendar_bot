class PagesController < ApplicationController
  def home
    @start_date = params.fetch(:start_date, Date.today).to_date
    @events = Event.today_events(@start_date)
  end

  def about
    @start_date = params.fetch(:start_date, Date.today).to_date
    @events = Event.today_events(@start_date)
  end
  
  def contact
  end
end
