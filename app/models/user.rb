class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :orders
	has_many :comments
  has_many :payments

	after_create :welcome_message
  	def welcome_message
    	UserMailer.welcome_email(self).deliver
  	end
end
