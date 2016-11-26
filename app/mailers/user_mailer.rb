class UserMailer < ApplicationMailer
	default from: "szabogergely07@gmail.com"

  	def contact_form(email, name, message)
  	@message = message
    mail(:from => email,
        :to => 'szabogergely07@gmail.com',
        :subject => "A new contact form message from #{name}")
  end
end
