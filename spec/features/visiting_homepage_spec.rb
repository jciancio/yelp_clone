require 'rails_helper'

feature 'Visting the Homepage' do
  before do
    visit root_path
  end

  it 'displays a link to view businesses' do
    find_link('Discover Some Businesses')
  end

  it 'displays a registration form' do
    within(:css, '#register') do
      find_field('Name')
      find_field('Email')
      find_field('Email confirmation')
      find_field('Password')
      find_field('Password confirmation')
      find_button('Create User')
    end
  end

  it 'displays a login form' do
    within(:css, '#login') do
      find_field('Email')
      find_field('Password')
      find_button('Log In')
    end
  end
end
