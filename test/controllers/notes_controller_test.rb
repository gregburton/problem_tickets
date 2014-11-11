require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  test 'post create is successful with valid attributes' do
    @problem = Problem.first
    @current_user = User.first

    assert_difference 'Note.count' do
      Note.create(text: 'text')
    end
    assert_redirected_to problem_path(@problem)
  end

  test 'post create is unsuccessful with invalid attributes' do
    @problem = Problem.first
    @current_user = User.first

    assert_no_difference 'Problem.count' do
      Note.create(text: '')
    end
    assert_template :new
  end
end