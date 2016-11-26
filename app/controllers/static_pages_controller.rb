class StaticPagesController < ApplicationController
  def index
  	puts "SENDGRID_USERNAME: #{ENV['SENDGRID_USERNAME']}"
puts "SENDGRID_PASSWORD: #{ENV['SENDGRID_PASSWORD']}"
  end

  def about
  	redirect_to "/static_pages/landing_page"
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

	def thank_you
	  @name = params[:name]
	  @email = params[:email]
	  @message = params[:message]
	  UserMailer.contact_form(@email, @name, @message).deliver_now
	end
end