# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Enable ActionMailer to use the Sendgrid plugin to send out emails from Heroku
ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => '587',
  :authentication => :plain,
  :user_name => ENV['app58362653@heroku.com'],
  :password => ENV['kutya'],
  :domain => 'heroku.com',
  :enable_starttls_auto => true
}