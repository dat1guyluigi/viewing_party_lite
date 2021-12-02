require 'rails_helper'

RSpec.describe 'Discover Index', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Sammy', email: 'sammysosa@yahoo.com')
    visit user_discover_path(@user)
  end

  describe 'user discover index' do
    it 'has a Top rated button' do

      click_button 'Top Rated Movies'

      expect(current_path).to eq("/users/#{@user.id}/movies")
    end

    it 'has a search button' do
      expect(page).to have_button('Top Rated Movies')

      click_button 'Top Rated Movies'

      expect(current_path).to eq("/users/#{@user.id}/movies")
    end
  end
end
