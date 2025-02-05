require "test_helper"

class EventAttendeesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get event_attendees_index_url
    assert_response :success
  end

  test "should get new" do
    get event_attendees_new_url
    assert_response :success
  end

  test "should get create" do
    get event_attendees_create_url
    assert_response :success
  end

  test "should get show" do
    get event_attendees_show_url
    assert_response :success
  end
end
