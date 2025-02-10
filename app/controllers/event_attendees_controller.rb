class EventAttendeesController < ApplicationController
  def index
    @attendees = EventAttendee.all
  end

  def new
    @attendee = EventAttendee.new
  end

  def create
    @event = Event.find(event_attendee_params[:attended_event_id])
    @attendee = @event.event_attendees.build(event: @event, user: current_user)

    if @attendee.save
      redirect_to @event
    else
      redirect_to root_path
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @attendee = current_user
    @event_attendee = EventAttendee.where(event_id: @event, user_id: @attendee)
    EventAttendee.destroy(@event_attendee)
    redirect_to @event
  end

  private

  def event_attendee_params
    params.expect(event_attendee: [ :attended_event_id, :attendee_id ])
  end
end
