require 'vline'

Vline.setup do |config|

  config.service_id = 'kindrdfood'
  config.provider_id = 'kindrdfood'
  config.client_id = '5oAnjbTFEqXc7UNraa0uVZrVeCnampG4dZM1SQ_j9_o'

  # WARNING: Do not check these values into VCS!
  config.client_secret = ENV['CLIENT_SECRET']
  config.provider_secret = ENV['PROVIDER_SECRET']
end
