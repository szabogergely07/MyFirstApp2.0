if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_mwVNYdwgf69oE5HHnOBrM4V1',
    :secret_key => 'sk_test_Q9YlnSfxTcJjsv6AWcVweTC1'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]