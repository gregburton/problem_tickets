require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  context "GET :new" do
    setup { get :new}

    should respond_with(:ok)
    should render_template(:new)
  end

  test 'post create is successful with valid attributes' do
    user_params = { name: 'Albert',
                    email: 'albert@me.org',
                    password: 'password',
                    password_confirmation: 'password'}
    assert_difference 'User.count' do
      post :create, user: user_params
    end
    assert_redirected_to logins_new_path
  end

  test 'post create is unsuccessful with invalid attributes' do
    invalid_params = { name: '', email: '', password: '', password_confirmation: '' }
    assert_no_difference 'User.count' do
      post :create, user: invalid_params
    end
    assert_template 'new'
  end

end
