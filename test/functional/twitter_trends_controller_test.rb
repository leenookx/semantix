require 'test_helper'

class TwitterTrendsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:twitter_trends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create twitter_trend" do
    assert_difference('TwitterTrend.count') do
      post :create, :twitter_trend => { }
    end

    assert_redirected_to twitter_trend_path(assigns(:twitter_trend))
  end

  test "should show twitter_trend" do
    get :show, :id => twitter_trends(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => twitter_trends(:one).to_param
    assert_response :success
  end

  test "should update twitter_trend" do
    put :update, :id => twitter_trends(:one).to_param, :twitter_trend => { }
    assert_redirected_to twitter_trend_path(assigns(:twitter_trend))
  end

  test "should destroy twitter_trend" do
    assert_difference('TwitterTrend.count', -1) do
      delete :destroy, :id => twitter_trends(:one).to_param
    end

    assert_redirected_to twitter_trends_path
  end
end
