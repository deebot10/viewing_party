class ViewingParty < ApplicationRecord
  belongs_to :user
  has_many :invitations
  
  validates_presence_of :movie_title
  validates :duration, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
end