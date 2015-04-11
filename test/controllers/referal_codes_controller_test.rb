require 'test_helper'

class ReferalCodesControllerTest < ActionController::TestCase
  setup do
    @referal_code = referal_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:referal_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referal_code" do
    assert_difference('ReferalCode.count') do
      post :create, referal_code: { code: @referal_code.code, email: @referal_code.email, hashtag_id: @referal_code.hashtag_id }
    end

    assert_redirected_to referal_code_path(assigns(:referal_code))
  end

  test "should show referal_code" do
    get :show, id: @referal_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @referal_code
    assert_response :success
  end

  test "should update referal_code" do
    patch :update, id: @referal_code, referal_code: { code: @referal_code.code, email: @referal_code.email, hashtag_id: @referal_code.hashtag_id }
    assert_redirected_to referal_code_path(assigns(:referal_code))
  end

  test "should destroy referal_code" do
    assert_difference('ReferalCode.count', -1) do
      delete :destroy, id: @referal_code
    end

    assert_redirected_to referal_codes_path
  end
end
