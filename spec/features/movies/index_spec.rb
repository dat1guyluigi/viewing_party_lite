require 'rails_helper'

RSpec.describe 'movie index page' do
  before(:each) do
    @user = User.create!(name: 'Sammy', email: 'sammysosa@yahoo.com')
  end

  it 'has the top movies on the page' do
    visit user_discover_path(@user)
    click_button 'Top Rated Movies'

    expect(page).to have_content('Title: Dilwale Dulhania Le Jayenge Rating: 8.7')
  end

  it 'finds movies' do
    visit user_discover_path(@user)
    fill_in 'ex: Stepbrothers', with: 'Jurassic'
    click_button 'Find Movies'

    expect(page).to have_content('Jurassic World')
  end

  it 'has a link to each movies show page' do
    visit user_discover_path(@user)
    click_button 'Top Rated Movies'
    click_link 'The Godfather'

    expect(page).to have_content('The Godfather')
  end
end
