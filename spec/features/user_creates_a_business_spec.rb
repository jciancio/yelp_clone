require 'rails_helper'

feature 'User can create a business' do
  let!(:user) { create(:user) }

  before do
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log In"
    click_link "Discover"
    click_link "Add a Business"
  end

  it 'redirects to business#new' do
    expect(current_path).to eq(new_business_path)
  end
  it 'redirects to business#show'
end
