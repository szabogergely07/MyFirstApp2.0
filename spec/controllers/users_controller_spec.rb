require 'rails_helper'

describe UsersController, :type => :controller do

  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }
    
  describe "GET #show" do
    context "User is logged in" do
      before do
        sign_in user
      end
      
      it "loads correct user details" do
        get :show, params: {id: user.id}
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq user
      end
      
      it "user cannot access user2 details" do
        get :show, params: {id: user2.id}
        expect(response).to have_http_status(302)
      end
    end
    
    context "No user is logged in" do
      it "redirects to login" do
        get :show, params: {id: user.id}
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end


end