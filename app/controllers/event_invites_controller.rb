class EventInvitesController < ApplicationController
  before_action :set_event, only: [ :index, :show, :create, :edit, :update, :destroy ]

  respond_to :html

  def index
    @event_invites = EventInvite.all
    respond_with(@event_invites)
  end

  def show
    @event_invite = EventInvite.where(event_id: @event, user_id: event_invite_params[:user_id])
    respond_with(@event_invite)
  end

  def new
    @event = Event.find(params[:event_id])
    @event_invite = EventInvite.new
  end

  def edit
  end

  def create
    @invited_user = User.find(event_invite_params[:user_id])
    @invitation = @event.event_invites.build(event: @event, user: @invited_user)

    @invitation.save
    flash[:notice] = "Invitiation successfully sent to #{@invited_user.username}"
    redirect_to @event
  end

  def update
    @event_invite.update(event_invite_params)
    respond_with(@event_invite)
  end

  def destroy
    @event_invite = EventInvite.find(params[:id])
    @event = @event_invite.event
    @invited_user = @event_invite.user
    @event_invite.destroy
    flash[:notice] = "Invitiation successfully sent to #{@invited_user.username}"
    redirect_to @event
  end

  private
    def set_event
      @event = Event.find(params[:event_id])
    end

    def event_invite_params
      params.expect(event_invite: [ :user_id ])
    end
end
