require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:andrew).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do
  	get :show, id: "doesn't exist"
  	assert_response :not_found
  end

  test "that variables are assigned on successful profiles" do
  	get :show, id: users(:andrew).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:trips)
  end

  test "only show the correct statuses are shown" do
    get :show, id: users(:andrew).profile_name
    assigns(:trips).each do |trip|
      assert_equal users(:andrew), trip.user
    end
  end

end
