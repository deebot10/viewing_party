require 'rails_helper'

RSpec.describe Invitation do
  describe 'relationships' do
    it {should belongs_to :user}
    it {should belongs_to :viewing_party}
  end
end