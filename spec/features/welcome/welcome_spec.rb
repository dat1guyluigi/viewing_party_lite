require 'rails_helper'

RSpec.describe 'home page' do
  before(:each) do
    @user = User.create!(name: 'Cheese', email: 'burger@food.com')
    visit root_path
  end

  it 'visits home page' do
    expect(current_path).to eq(root_path)
  end

  it 'has a button to create a new user' do
    click_button 'Create a New User'
    expect(current_path).to eq(new_user_path)
  end

  it 'has a link to each users dashboard' do
    expect(page).to have_content(@user.email)
    
    click_link @user.email

    expect(current_path).to eq(user_path(@user.id))
  end
end
