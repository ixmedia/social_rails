SocialRails::API::Facebook.configure do |config|

  # Required

  #config.app_id      = ""
  #config.app_secret  = ""
  #config.page_name   = ""
end

SocialRails::API::Instagram.configure do |config|

  # Required

  #config.user_id      = ""
  #config.access_token = ""
end

SocialRails::API::Twitter.configure do |config|

  # Required

  #config.consumer_key        = ""
  #config.consumer_secret     = ""
  #config.access_token        = ""
  #config.access_token_secret = ""
  #config.twitter_name        = ""
end

DetectLanguage.configure do |config|
  # https://detectlanguage.com/
  config.api_key = "YOUR API KEY"

  # enable secure mode (SSL) if you are passing sensitive data
  # config.secure = true
end
