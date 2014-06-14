require 'test_helper'

class PrivateKeysControllerTest < ActionController::TestCase
  setup do
    @private_key = private_keys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:private_keys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create private_key" do
    assert_difference('PrivateKey.count') do
      post :create, private_key: { encoded_key: @private_key.encoded_key, key_size: @private_key.key_size }
    end

    assert_redirected_to private_key_path(assigns(:private_key))
  end

  test "should show private_key" do
    get :show, id: @private_key
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @private_key
    assert_response :success
  end

  test "should update private_key" do
    patch :update, id: @private_key, private_key: { encoded_key: @private_key.encoded_key, key_size: @private_key.key_size }
    assert_redirected_to private_key_path(assigns(:private_key))
  end

  test "should destroy private_key" do
    assert_difference('PrivateKey.count', -1) do
      delete :destroy, id: @private_key
    end

    assert_redirected_to private_keys_path
  end
end
