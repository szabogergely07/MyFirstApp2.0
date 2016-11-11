class StaticPagesController < ApplicationController
  def index
  end

  # Dinamically show products in carousel depends on total amount
	def landing_page
		def x
			if Product.count <= 3
				x = 2	
			elsif
				Product.count < 10
				x = 3
			else
				x = 4
			end
		end
	@products = Product.limit(x)
	end
end