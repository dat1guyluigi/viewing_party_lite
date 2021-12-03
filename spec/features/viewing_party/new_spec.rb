require 'rails_helper'

RSpec.describe 'New Viewing Party', type: :feature do
  before(:each) do
    @user_1 = User.create!(name: 'Sammy', email: 'sammysosa@yahoo.com')
    @user_2 = User.create!(name: 'Tim', email: 'Tim@yahoo.com')
    @user_3 = User.create!(name: 'Jim', email: 'Jim@yahoo.com')

    @movie_1 = MovieService.movie(19404)

    visit "/users/#{@user_1.id}/movies/#{@movie_1[:id]}/viewing_parties/new"
  end

  describe 'New Viewing Party' do
    it 'has a form for a new viewing party' do
      
      expect(page).to have_content("Create a Movie Party for #{@movie_1[:title]}")
    end

    it 'can create a new viewing party' do
      fill_in 'start_time' , with: 1600
      fill_in 'date' , with: "12/30/2021"
      click_button 'Create'

      expect(current_path).to eq(user_path(@user_1))
    end
  end
end