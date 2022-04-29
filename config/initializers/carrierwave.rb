#================ Config AWS ================#

# require "carrierwave/storage/fog"

# CarrierWave.configure do |config|
#   config.fog_credentials = {
#     provider: "AWS",
#     aws_access_key_id: Rails.application.credentials.access_key_id,
#     aws_secret_access_key: Rails.application.credentials.secret_access_key,
#     region: Rails.application.credentials.s3_region,
#     path_style: true,
#     host: "s3.us-east-2.amazonaws.com",
#     endpoint: "https://s3.us-east-2.amazonaws.com"
#   }
#   config.cache_dir = "#{Rails.root}/tmp/uploads"
#   config.fog_directory = Rails.application.credentials.s3_bucket
#   config.fog_public = true
#   config.fog_attributes = { "Cache-Control" => "max-age=#{10.day.to_i}" }
#   config.storage = :fog
# end

#================ Config Google Cloud ================#

# CarrierWave.configure do |config|
#   config.fog_credentials = {
#     provider: "Google", google_project: ENV["GOOGLE_PROJECT"], google_json_key_string: ENV["GOOGLE_JSON_KEY_STRING"]
#   }
#   # can optionally use google_json_key_location if using an actual file;

#   config.fog_directory = ENV["FOG_DIRECTORY"]

#   config.fog_public = false
# end
