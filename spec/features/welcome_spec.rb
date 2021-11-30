require 'rails_helper'

RSpec.describe 'home page' do
  before(:each) do
    visit root_path
  end

  it 'visits home page' do
    expect(current_path).to eq(root_path)
  end

  it 'has a button to create a new user' do
    click_button 'Create a New User'
    expect(current_path).to eq(new_user_path)
  end
end
