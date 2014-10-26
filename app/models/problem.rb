class Problem < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  default_scope -> { order('created_at ASC') }

  validates :description, presence: true
  validates :attempt, presence: true
  validates :user_id, presence: true
end
