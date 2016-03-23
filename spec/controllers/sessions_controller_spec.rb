require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
    let!(:user) { create(:user) }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http redirect" do
      post :create
      expect(response).to have_http_status(:redirect)
    end

    it "adds user id to the session object" do
      post :create, email: user.email, password: user.password
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe "DELETE #destroy" do
    it "returns http redirect" do
      delete :destroy, id: user.id
      expect(response).to have_http_status(:redirect)
    end

    it "destroys the session" do
      expect(session[:user_id]).to eq(nil)
    end
  end

end
