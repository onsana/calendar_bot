class EventsController < ApplicationController
  def index
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  def set_event
    @event = Event.find(params[:id]).decorate
  end

  def event_params
    params.require(:event).permit(:title, :content, :start_time, :published_at, :without_year, :body)
  end
end
