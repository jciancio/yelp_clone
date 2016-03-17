require 'rails_helper'

feature 'Logging In' do
  before do
    @user = FactoryGirl.build(:user)
    @user.email_confirmation = @user.email
    @user.password_confirmation = @user.password
    @user.save
  end

  it 'redirects to the user#show' do
    visit root_path
    find_field('user[email]')
    find_field('user[password]')
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button('Log In')
    expect(current_path).to eq(sessions_path)
    page.has_content? @user.email
  end
end
