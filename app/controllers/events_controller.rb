class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(user_id: current_user.id)
    @event.update!(event_params)

    if @event.save
      redirect_to current_user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.expect(event: [ :title, :location, :event_date, :details ])
  end
end
