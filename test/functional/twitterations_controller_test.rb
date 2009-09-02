require 'test_helper'

class TwitterationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:twitterations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create twitterations" do
    assert_difference('Twitterations.count') do
      post :create, :twitterations => { }
    end

    assert_redirected_to twitterations_path(assigns(:twitterations))
  end

  test "should show twitterations" do
    get :show, :id => twitterations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => twitterations(:one).to_param
    assert_response :success
  end

  test "should update twitterations" do
    put :update, :id => twitterations(:one).to_param, :twitterations => { }
    assert_redirected_to twitterations_path(assigns(:twitterations))
  end

  test "should destroy twitterations" do
    assert_difference('Twitterations.count', -1) do
      delete :destroy, :id => twitterations(:one).to_param
    end

    assert_redirected_to twitterations_path
  end
end
