class Product < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true
	validates :image_url, presence: true
	validates :price, presence: true, numericality: {only_integer: true}

	has_many :orders
	has_many :comments

	def highest_rating_comment
		comments.rating_desc.first
	end

	def lowest_rating_comment
		comments.rating_asc.first
	end

	def average_rating
  	comments.average(:rating).to_f
	end

	def total_comment
    $redis.set("totalComment", comments.count)
    $redis.get("totalComment")
  end
end
