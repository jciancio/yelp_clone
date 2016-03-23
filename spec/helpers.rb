module Helpers
  def sign_in(user)
    visit login_path
    find_field('Email')
    find_field('Password')
    find_button('Log In')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button('Log In')
  end
end
