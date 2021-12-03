require 'rails_helper'

RSpec.describe 'show', type: :feature do
  before(:each) do
    @user_1 = User.create!(name: 'Sammy', email: 'sammysosa@yahoo.com')
    @user_2 = User.create!(name: 'Timmy', email: 'tim@yahoo.com')

    @party_1 = Party.create!(date: '12/25/2021', length: 255, time: 1600, movie_id: 19404, host_id: @user_1.id)
    @party_2 = Party.create!(date: '12/26/2021', length: 215, time: 1800, movie_id: 500, host_id: @user_2.id)

    @userparty_1 = UserParty.create!(party_id: @party_1.id, user_id: @user_1.id)
    @userparty_2 = UserParty.create!(party_id: @party_1.id, user_id: @user_2.id)
    @userparty_3 = UserParty.create!(party_id: @party_2.id, user_id: @user_1.id)
    @userparty_4 = UserParty.create!(party_id: @party_2.id, user_id: @user_2.id)

    visit user_path(@user_1)
  end
  describe 'user show page' do
    it 'has user information' do
      expect(page).to have_content 'Welcome Sammy!'
    end

    it 'has a discover movies button' do
      click_button 'Discover Movies'

      expect(current_path).to eq(user_discover_path(@user_1))
    end

    describe 'viewing party' do
      it 'has a viewing parties section' do
        expect(page).to have_content "#{@user_1.name}'s Viewing Parties:"
      end

      it 'has movie info in viewing party' do
        within("#id-#{@party_1.id}") do
          expect(page).to have content("")
        end
      end
    end
  end
end
