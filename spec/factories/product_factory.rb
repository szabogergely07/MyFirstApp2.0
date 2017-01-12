FactoryGirl.define do
	sequence(:name) { |n| "bike#{n}@example.com" }
	
	factory :product do
		name
		description "Nice bike"
		image_url "www.picture.pic.com"
		price 11
	end
end