require 'rails_helper'

RSpec.describe 'new user page' do
  before(:each) do
    @user = User.create!(name: 'Sammy', email: 'sammysosa@yahoo.com')
    visit new_user_path
  end

  it 'visits the page' do
    expect(current_path).to eq(new_user_path)
  end

  it 'navigates home from create user page' do
    click_link 'Home'

    expect(current_path).to eq(root_path)
  end

  it 'creates a new user' do
    fill_in 'Name', with: "Tim"
    fill_in 'Email', with: "Tim@tim.com"
    click_button 'Create Account'

    visit root_path
    expect(page).to have_content("Tim@tim.com")
  end

  it 'does not create user with missing fields' do
    fill_in 'Email', with: @user.email
    click_button 'Create Account'

    expect(current_path).to eq(new_user_path)
    expect(page).to_not have_content(@user.email)
    expect(page).to have_content('Please try again.')
  end
  
  it 'ensures disctinct email' do
    fill_in 'Name', with: @user.name
    fill_in 'Email', with: @user.email
    click_button 'Create Account'

    expect(page).to have_content('Please try again.')
  end
end
