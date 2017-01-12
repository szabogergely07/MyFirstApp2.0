require 'rails_helper'
describe Product do
	before "when the product has comments" do
			@product = FactoryGirl.create(:product)
			@user = FactoryGirl.create(:user) 
			@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
			@product.comments.create!(rating: 3, user: @user, body: "Not bad")
			@product.comments.create!(rating: 5, user: @user, body: "Super!")
	end
	it "returns the average rating of all comments" do
			expect(@product.average_rating).to eq 3
	end
	it "is not valid" do
		expect(Product.new(description: "Nice bike")).not_to be_valid
	end
end