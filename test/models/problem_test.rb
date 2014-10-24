require 'test_helper'

class ProblemTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:notes)
end



# should have brief description
# should have description of what was tried
# should have user_id of creator
# should default as unsolved
# should know if its solved
# should know its notes

