set :stage, :production
set :rails_env, :production
set :branch, "main"
set :deploy_to, "/home/deploy/deploy/k_api"
server "18.136.67.161", user: "deploy", roles: %w{app db web}

# set :default_env, {
#   "SECRET_KEY_BASE" => ENV["SECRET_KEY_BASE"]
# }
