class User < ApplicationRecord
  has_many :viewing_parties
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :invitations

  validates :username, uniqueness: true, presence: true 
  validates :email, uniqueness: true, presence: true 
  validates :password, presence: true 
  has_secure_password 
end