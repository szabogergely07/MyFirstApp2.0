require 'rails_helper'

describe UsersController, :type => :controller do

  let(:user) { User.create!(email: "Joe@joe.at", password: "joejoe") }
  let(:user2) { User.create!(email: "pista@baja.hu", password: "pistaba") }
    
  describe "GET #show" do
    context "User is logged in" do
      before do
        sign_in user
      end
      
      it "loads correct user details" do
        get :show, id: user.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq user
      end
      
      it "user cannot access user2 details" do
        get :show, id: user2.id
        expect(response).to have_http_status(302)
      end
    end
    
    context "No user is logged in" do
      it "redirects to login" do
        get :show, id: user.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end


end