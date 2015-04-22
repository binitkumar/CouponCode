require 'test_helper'

class AuthorizedEmailsControllerTest < ActionController::TestCase
  setup do
    @authorized_email = authorized_emails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:authorized_emails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create authorized_email" do
    assert_difference('AuthorizedEmail.count') do
      post :create, authorized_email: { email: @authorized_email.email, hashtag_id: @authorized_email.hashtag_id }
    end

    assert_redirected_to authorized_email_path(assigns(:authorized_email))
  end

  test "should show authorized_email" do
    get :show, id: @authorized_email
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @authorized_email
    assert_response :success
  end

  test "should update authorized_email" do
    patch :update, id: @authorized_email, authorized_email: { email: @authorized_email.email, hashtag_id: @authorized_email.hashtag_id }
    assert_redirected_to authorized_email_path(assigns(:authorized_email))
  end

  test "should destroy authorized_email" do
    assert_difference('AuthorizedEmail.count', -1) do
      delete :destroy, id: @authorized_email
    end

    assert_redirected_to authorized_emails_path
  end
end
