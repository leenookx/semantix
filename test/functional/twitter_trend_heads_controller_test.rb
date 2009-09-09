require 'test_helper'

class TwitterTrendHeadsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:twitter_trend_heads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create twitter_trend_head" do
    assert_difference('TwitterTrendHead.count') do
      post :create, :twitter_trend_head => { }
    end

    assert_redirected_to twitter_trend_head_path(assigns(:twitter_trend_head))
  end

  test "should show twitter_trend_head" do
    get :show, :id => twitter_trend_heads(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => twitter_trend_heads(:one).to_param
    assert_response :success
  end

  test "should update twitter_trend_head" do
    put :update, :id => twitter_trend_heads(:one).to_param, :twitter_trend_head => { }
    assert_redirected_to twitter_trend_head_path(assigns(:twitter_trend_head))
  end

  test "should destroy twitter_trend_head" do
    assert_difference('TwitterTrendHead.count', -1) do
      delete :destroy, :id => twitter_trend_heads(:one).to_param
    end

    assert_redirected_to twitter_trend_heads_path
  end
end
