require 'rails_helper'
describe Comment do
	it "create a valid comment" do
    expect(FactoryGirl.build(:comment)).to be_valid
  end
end