FactoryGirl.define do
  factory :comment do
  	rating 3
  	association :user, strategy: :build
  	association :product, strategy: :build
  	body "That is a nice bike"
  end

end