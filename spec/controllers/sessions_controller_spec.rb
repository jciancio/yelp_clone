require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  before do
    @user = FactoryGirl.build(:user)
    @user.email_confirmation = @user.email
    @user.password_confirmation = @user.password
    @user.save
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http redirect" do
      user = @user
      user.authenticate(@user.password)
      post :create
      expect(response).to have_http_status(:redirect)
    end

    it "adds user id to the session object" do
      expect(session[:user_id]).to eq(@user.id)
    end
  end

  describe "DELETE #destroy" do
    it "returns http redirect" do
      delete :destroy, id: @user.id
      expect(response).to have_http_status(:redirect)
    end

    it "destroys the session" do
      expect(session[:user_id]).to eq(nil)
    end
  end

end
