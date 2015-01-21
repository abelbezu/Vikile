OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['433818746768321'], ENV['8079339a2de70882db8514fc6f825c9b']
end