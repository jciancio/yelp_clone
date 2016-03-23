require 'rails_helper'

feature 'Logging In' do
  let!(:user) { create(:user) }

  context 'with correct user information' do

    before do
      sign_in(user)
    end

    it 'redirects to the user#show' do
      expect(current_path).to eq(user_path(user))
      expect(page).to have_content(@user)
    end
  end

  context 'with incorrect user information' do

    before do
      incorrect_sign_in(user)
    end

    it 'rerenders the login page' do
      expect(current_path).to eq(login_path)
    end
  end
end
