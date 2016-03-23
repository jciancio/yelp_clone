require 'rails_helper'

feature 'User can create a business' do
  let!(:user) { create(:user) }

  before do
    sign_in(user)
    click_link "Discover"
    click_link "Add a Business"
  end

  it 'redirects to business#new' do
    expect(current_path).to eq(new_business_path)
  end
  it 'redirects to business#show'
end
