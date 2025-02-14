require "application_system_test_case"

class EventInvitesTest < ApplicationSystemTestCase
  setup do
    @event_invite = event_invites(:one)
  end

  test "visiting the index" do
    visit event_invites_url
    assert_selector "h1", text: "Event invites"
  end

  test "should create event invite" do
    visit event_invites_url
    click_on "New event invite"

    fill_in "Event", with: @event_invite.event_id
    fill_in "User", with: @event_invite.user_id
    click_on "Create Event invite"

    assert_text "Event invite was successfully created"
    click_on "Back"
  end

  test "should update Event invite" do
    visit event_invite_url(@event_invite)
    click_on "Edit this event invite", match: :first

    fill_in "Event", with: @event_invite.event_id
    fill_in "User", with: @event_invite.user_id
    click_on "Update Event invite"

    assert_text "Event invite was successfully updated"
    click_on "Back"
  end

  test "should destroy Event invite" do
    visit event_invite_url(@event_invite)
    click_on "Destroy this event invite", match: :first

    assert_text "Event invite was successfully destroyed"
  end
end
