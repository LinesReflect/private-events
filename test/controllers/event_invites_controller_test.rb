require "test_helper"

class EventInvitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_invite = event_invites(:one)
  end

  test "should get index" do
    get event_invites_url
    assert_response :success
  end

  test "should get new" do
    get new_event_invite_url
    assert_response :success
  end

  test "should create event_invite" do
    assert_difference("EventInvite.count") do
      post event_invites_url, params: { event_invite: { event_id: @event_invite.event_id, user_id: @event_invite.user_id } }
    end

    assert_redirected_to event_invite_url(EventInvite.last)
  end

  test "should show event_invite" do
    get event_invite_url(@event_invite)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_invite_url(@event_invite)
    assert_response :success
  end

  test "should update event_invite" do
    patch event_invite_url(@event_invite), params: { event_invite: { event_id: @event_invite.event_id, user_id: @event_invite.user_id } }
    assert_redirected_to event_invite_url(@event_invite)
  end

  test "should destroy event_invite" do
    assert_difference("EventInvite.count", -1) do
      delete event_invite_url(@event_invite)
    end

    assert_redirected_to event_invites_url
  end
end
