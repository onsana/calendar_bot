# frozen_string_literal: true

class Admin::EventsController < Admin::BaseController
  before_action :set_event, only: [:show, :toggle_publish, :edit, :update, :destroy]

  def index
    # @events = EventDecorator.decorate_collection(Event.order(:eventday))
    # @pagy, @events = pagy(EventDecorator.decorate_collection(Event.order(:eventday)))
    @pagy, @events = pagy(Event.order(:eventday))
  end

  def calendar
    start_date = params.fetch(:start_date, Date.today).to_date
    @events = Event.month_events(start_date)
  end
  
  def show
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to [:admin, @event], notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @event] }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to [:admin, @event], notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @event] }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to admin_events_path, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_publish
    if @event.published?
      @event.published_at = nil
      @event.save
    else
      @event.publish
    end
    redirect_to [:admin, @event], notice: 'Event was successfully updated.'
  end
  
  private

  def set_event
    @event = Event.find(params[:id]).decorate
  end

  def event_params
    params.require(:event).permit(:title, :content, :started_at, :published_at)
  end
end
