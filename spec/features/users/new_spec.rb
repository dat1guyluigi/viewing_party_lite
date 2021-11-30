require 'rails_helper'

RSpec.describe 'new user page' do
  before(:each) do
    visit new_user_path
  end

  it 'visits the page' do
    expect(current_path).to eq(new_user_path)
  end

  it 'navigates home from create user page' do
    click_link 'Home'

    expect(current_path).to eq(root_path)
  end
end
