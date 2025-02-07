class EventsController < ApplicationController
  before_action :require_login, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :verify_creator, only: [ :edit, :update, :destroy ]
  before_action :check_if_passed, only: [ :edit, :update, :destroy ]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to current_user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to current_user
  end

  private

  def event_params
    params.expect(event: [ :title, :location, :event_date, :details ])
  end

  def require_login
    unless current_user
      flash[:notice] = "You must login to do this action!"
      redirect_to new_user_session_path
    end
  end

  def verify_creator
    unless current_user.events.include?(Event.find(params[:id]))
      flash[:notice] = "Only the creator of this event has authority to do that action!"
      redirect_to event_path(params[:id])
    end
  end

  def check_if_passed
    if Event.past.include?(Event.find(params[:id]))
      flash[:notice] = "Events that have passed cannot be edited!"
      redirect_to event_path(params[:id])
    end
  end
end
