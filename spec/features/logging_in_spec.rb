require 'rails_helper'

feature 'Logging In' do
  let!(:user) { create(:user) }

  before do
    sign_in(user)
  end

  it 'redirects to the user#show' do
    expect(current_path).to eq(user_path(user))
    # expect(page).to have_content(@user)
  end
end
