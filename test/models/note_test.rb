require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:problem)

  should validate_presence_of(:text)
  should validate_presence_of(:user_id)
  should validate_presence_of(:problem_id)
end
# should_eventually notify problem creator when note by other user is created

