require 'test_helper'

class AppRequestsControllerTest < ActionController::TestCase
  setup do
    @app_request = app_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:app_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create app_request" do
    assert_difference('AppRequest.count') do
      post :create, app_request: { company: @app_request.company, email: @app_request.email, message: @app_request.message, name: @app_request.name }
    end

    assert_redirected_to app_request_path(assigns(:app_request))
  end

  test "should show app_request" do
    get :show, id: @app_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @app_request
    assert_response :success
  end

  test "should update app_request" do
    put :update, id: @app_request, app_request: { company: @app_request.company, email: @app_request.email, message: @app_request.message, name: @app_request.name }
    assert_redirected_to app_request_path(assigns(:app_request))
  end

  test "should destroy app_request" do
    assert_difference('AppRequest.count', -1) do
      delete :destroy, id: @app_request
    end

    assert_redirected_to app_requests_path
  end
end
