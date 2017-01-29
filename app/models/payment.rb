class Payment < ApplicationRecord
	belongs_to :order

	after_create :payment_message
  	def payment_message
    	UserMailer.payment_email(self).deliver
  	end
end
