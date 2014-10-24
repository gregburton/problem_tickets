require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:notes)

  should validate_presence_of(:description)
  should validate_presence_of(:attempt)
  should validate_presence_of(:user_id)
end

