require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
	let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
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

      it "user cannot delete product" do
        delete :destroy, params: {id: product.id}
        expect(response).to have_http_status(302)
      end
    end

    context "Admin is logged in" do
      before do
        sign_in admin
      end

      it "admin can delete product" do
        delete :destroy, params: {id: product.id}
        expect(response).to redirect_to(products_path)
      end
    end
  end
end
