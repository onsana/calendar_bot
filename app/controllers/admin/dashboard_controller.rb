class Admin::DashboardController < Admin::BaseController
  def index
    @events = EventDecorator.decorate_collection(Event.today_events)
  end
end
