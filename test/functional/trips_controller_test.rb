require 'test_helper'

class TripsControllerTest < ActionController::TestCase
  setup do
    @trip = trips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trips)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render the new page when logged in" do
    sign_in users(:andrew)
    get :new
    assert_response :success
  end

  test "should be logged in to post a trip" do
    post :create, trip: { content: "Hello" }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create trip when logged in" do
    sign_in users(:andrew)

    assert_difference('Trip.count') do
      post :create, trip: { content: @trip.content }
    end

    assert_redirected_to trip_path(assigns(:trip))
  end

  test "should show trip" do
    get :show, id: @trip
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @trip
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit when logged in" do
    sign_in users(:andrew)
    get :edit, id: @trip
    assert_response :success
  end

  test "should redirect trip update when not logged in" do
    put :update, id: @trip, trip: { content: @trip.content }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update trip when logged in" do
    sign_in users(:andrew)
    put :update, id: @trip, trip: { content: @trip.content }
    assert_redirected_to trip_path(assigns(:trip))
  end

  test "should destroy trip" do
    assert_difference('Trip.count', -1) do
      delete :destroy, id: @trip
    end

    assert_redirected_to trips_path
  end
end
