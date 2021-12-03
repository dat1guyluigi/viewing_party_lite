require 'rails_helper'

RSpec.describe 'movie show page' do
  before(:each) do
    @user = User.create!(name: 'Sammy', email: 'sammysosa@yahoo.com')

    visit user_discover_path(@user)
    click_button 'Top Rated Movies'
    click_link 'The Godfather'
  end

  it 'visits the movies show page' do
    expect(page).to have_content('The Godfather')
  end

  it 'has a button to return to discover page' do
    click_button 'Discover Page'

    expect(current_path).to eq(user_discover_path(@user))
  end
end
