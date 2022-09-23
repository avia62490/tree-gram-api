
Cloudinary.config do |config|
  config.cloud_name =  Rails.application.credentials[:development][:cloud_name]
  config.api_key =  Rails.application.credentials[:development][:api_key]
  config.api_secret = Rails.application.credentials[:development][:api_secret]
  config.secure = true
  config.cdn_subdomain = true
end

