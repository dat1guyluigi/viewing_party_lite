require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it {should have_many(:parties).through(:user_parties)}
    it {should have_many :user_parties}
  end
end
