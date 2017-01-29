require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
	let(:user) { FactoryGirl.create(:user) }
	let(:product) { FactoryGirl.create(:product) }
    
  describe "GET New Product" do
    context "User is logged in" do
      before do
        sign_in user
  		end
      
      it "loads new product details" do
        get :show, params: {id: product.id}
        expect(response).to have_http_status(200)
      end
    end
  end
end