require 'rails_helper'

RSpec.describe ViewingParty do
  describe 'relationships' do
    it {should belongs_to :user}
    it {should have_many :invitations}
  end

  describe 'validations' do
    it {should validate_presence_of(:movie_title) }
    it {should validate_presence_of(:duration) }
    it {should validate_presence_of(:start_time) }
    it {should validate_presence_of(:date) }
  end
end 