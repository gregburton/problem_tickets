class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem

  validates :text, presence: true
  validates :user_id, presence: true
  validates :problem_id, presence: true
end
