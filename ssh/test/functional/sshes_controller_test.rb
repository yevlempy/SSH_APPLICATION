require 'test_helper'

class SshesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sshes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ssh" do
    assert_difference('Ssh.count') do
      post :create, :ssh => { }
    end

    assert_redirected_to ssh_path(assigns(:ssh))
  end

  test "should show ssh" do
    get :show, :id => sshes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sshes(:one).to_param
    assert_response :success
  end

  test "should update ssh" do
    put :update, :id => sshes(:one).to_param, :ssh => { }
    assert_redirected_to ssh_path(assigns(:ssh))
  end

  test "should destroy ssh" do
    assert_difference('Ssh.count', -1) do
      delete :destroy, :id => sshes(:one).to_param
    end

    assert_redirected_to sshes_path
  end
end
