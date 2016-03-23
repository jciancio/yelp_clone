require 'rails_helper'

feature 'Logging Out' do
  let!(:user) { create(:user) }

  before do
    sign_in(user)
    expect(page).to have_content('Log Out')
    sign_out(user)
  end

  it 'redirects to welcome page and logs out' do
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Logged Out!')
  end
end
