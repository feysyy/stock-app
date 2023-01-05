IEX::Api.configure do |config|
  config.publishable_token = ENV['IEX_PUBLIC_KEY']
  config.secret_token = ENV['IEX_SECRET_KEY']
  config.endpoint =  'https://cloud.iexapis.com/v1' #'https://sandbox.iexapis.com/v1'
end
