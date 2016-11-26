class StaticPagesController < ApplicationController
  def index
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
	  ActionMailer::Base.mail(:from => @email,
	    :to => 'szabogergely07@gmail.com',
	    :subject => "A new contact form message from #{@name}",
	    :body => @message).deliver_now
	end
end