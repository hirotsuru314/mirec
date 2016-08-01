Rails.application.config.middleware.use OmniAuth::Builder do
  provider :hatena,
    Rails.application.secrets.hatena_consumer_key,
    Rails.application.secrets.hatena_consumer_secret
end

=begin  
  ENV['HATENA_CONSUMER_KEY'],
  ENV['HATENA_CONSUMER_SECRET'],
  {
    scope: "read_public"
  }
=end

