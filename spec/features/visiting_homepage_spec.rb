require 'rails_helper'

feature 'Visting the Homepage' do
  before do
    visit root_path
  end

  it 'displays a registration form' do
    page.has_content?('Register')
    find_field('user[name]')
    find_field('user[email]')
    find_field('user[email_confirmation]')
    find_field('user[password]')
    find_field('user[password_confirmation]')
    find_button('Create User')
  end

  it 'displays a login form' do
    find_field('user[email]')
    find_field('user[password]')
    find_button('Login')
  end
end
