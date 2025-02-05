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

  private

  def event_attendee_params
    params.expect(event_attendee: [ :attended_event_id, :attendee_id ])
  end
end
