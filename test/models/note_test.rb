require 'test_helper'

class NoteTest < ActiveSupport::TestCase

  should belong_to(:user)
  should belong_to(:problem)

end



# should have text
# should have user_id of creator
# should have problem_id of problem its attached to
# should_eventually notify problem creator when note by other user is created

