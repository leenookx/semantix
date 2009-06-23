require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:links)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_links
    assert_difference('Links.count') do
      post :create, :links => { }
    end

    assert_redirected_to links_path(assigns(:links))
  end

  def test_should_show_links
    get :show, :id => links(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => links(:one).id
    assert_response :success
  end

  def test_should_update_links
    put :update, :id => links(:one).id, :links => { }
    assert_redirected_to links_path(assigns(:links))
  end

  def test_should_destroy_links
    assert_difference('Links.count', -1) do
      delete :destroy, :id => links(:one).id
    end

    assert_redirected_to links_path
  end
end
