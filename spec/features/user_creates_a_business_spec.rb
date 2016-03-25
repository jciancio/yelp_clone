require 'rails_helper'

feature 'User can create a business' do
  let!(:user) { create(:user) }
  fields = ['Name', 'Description', 'Address', 'City', 'State', 'Zip']

  before do
    sign_in(user)
    click_link "Discover"
    click_link "Add a Business"
  end

  it 'redirects to business#new' do
    expect(current_path).to eq(new_business_path)
  end

  context 'with valid business attributes' do
    let!(:business) { build(:business) }

    before do
      fields.each do |field|
        find_field(field)
        p business[field.downcase]
        fill_in field, with: business[field.downcase]
      end
      p business
    end

    it 'redirects to business#show' do
      click_button('Create Business')
      p business
      # expect(business.save).to eq(true)
      expect(current_path).to eq(business_path(business))
    end
  end
end
