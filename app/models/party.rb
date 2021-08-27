class Party < ApplicationRecord
  belongs_to :user
  has_many :invitations

  validates :movie_id, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
end
