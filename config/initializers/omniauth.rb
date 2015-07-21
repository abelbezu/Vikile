OmniAuth.config.logger = Rails.logger


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'] = '433818746768321', ENV['FACEBOOK_SECRET'] = '8079339a2de70882db8514fc6f825c9b', :scope => "user_likes, user_photos, email, publish_actions", :client_options => {:ssl => {:ca_file => "C:\\curl-ca-bundle.crt"}} 
end