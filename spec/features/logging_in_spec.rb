require 'rails_helper'

feature 'Logging In' do
  before do
    @user = FactoryGirl.build(:user)
    @user.email_confirmation = @user.email
    @user.password_confirmation = @user.password
    @user.save
    visit login_path
    find_field('Email')
    find_field('Password')
    find_link('Log In')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_link('Log In')
  end

  it 'redirects to the user#show' do
    # expect(current_path).to eq(user_path(@user))
    # expect(page).to have_content(@user)
  end
end
