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
    fill_in 'Name', with: @user.name
    fill_in 'Email', with: @user.email
    click_button 'Create Account'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('New user created.')
    expect(page).to have_content(@user.email)
  end

  it 'does not create user with missing fields' do
    fill_in 'Email', with: @user.email
    click_button 'Create Account'

    expect(current_path).to eq(new_user_path)
    expect(page).to_not have_content(@user.email)
    expect(page).to have_content('Please try again.')
  end
end
