require 'rails_helper'

feature 'Visting the Homepage' do
  before do
    visit root_path
  end

  it 'displays a registration form' do
    find_field('Name')
    find_field('Email')
    find_field('Email Confirmation')
    find_field('Password')
    find_field('Password Confirmation')
  end

  it 'displays a login form' do
  end
end
