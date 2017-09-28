class Product < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true
	validates :image_url, presence: true
	validates :price, presence: true, numericality: {only_integer: true}

	has_many :orders
	has_many :comments, dependent: :nullify

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
		unless $redis.keys.include?("total_comment_#{id}")
			$redis.set('total_comment_#{comment.product_id}', comments.count)				
		end
    	
		$redis.get('total_comment_#{comment.product_id}')  
  end
end
