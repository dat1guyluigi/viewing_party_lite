require 'rails_helper'

RSpec.describe 'show', type: :feature do
  before(:each) do
    @user = User.create!(name: 'Sammy', email: 'sammysosa@yahoo.com')
    visit user_path(@user)
  end
  describe 'user show page' do
    it 'has user information' do
      expect(page).to have_content 'Welcome Sammy!'
    end

    it 'has a discover movies button' do
      click_button 'Discover Movies'

      expect(current_path).to eq(user_discover_path(@user))
    end

    it 'has a viewing parties section' do

      expect(page).to have_content "#{@user.name}'s Viewing Parties:"
    end
  end
end
