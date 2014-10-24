require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:problems)
  should have_many(:notes)
end


#
# should have name
# should have unique email
# should not allow bad email format

# should have secure password



