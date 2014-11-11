require 'test_helper'

class ProblemsControllerTest < ActionController::TestCase
  test 'get new is successful' do
    get :new
    assert_kind_of Problem, assigns(:problem)
    assert_response :success
  end

  test 'post create is successful with valid attributes' do
    @current_user = User.first
    problem_params = { description: 'How?',
                       attempt: "I'm trying!" }

    assert_difference 'Problem.count' do
      Problem.create(problem_params)
    end
    assert_redirected_to problem_path(@problem)
  end

  test 'post create is unsuccessful with invalid attributes' do
    @current_user = User.first
    invalid_params = { description: '', attempt: '' }
    assert_no_difference 'Problem.count' do
      Problem.create(invalid_params)
    end
    assert_template :new
  end

  test 'get index is successful & lists only unsolved problems' do
    get :index
    assert_includes assigns(:problem), problems(:one)
    refute_includes assigns(:problem), problems(:two)
    assert_response :success
  end

  test 'get show is successful' do
    get :show, id: problems(:one).id
    assert_equal problems(:one), assigns(:problem)
    assert_response :success
  end
end