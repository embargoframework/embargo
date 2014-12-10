Traitify.configure do |config|
  config.secret = ENV["TRAITIFY_SECRET_KEY"]
  config.api_host = ENV["TRAITIFY_HOST"]
  config.api_version = "v1"
end