require 'rails_helper'

feature 'Logging Out' do
  before do
    @user = FactoryGirl.build(:user)
    @user.email_confirmation = @user.email
    @user.password_confirmation = @user.password
    @user.save
  end

  it 'redirects to root path' do
    visit root_path
    find_field('user[email]')
    find_field('user[password]')
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button('Log In')
    expect(page).to have_content('Log Out')
    page.has_content? 'Log Out'
  end
  it 'removes the current user'
end
