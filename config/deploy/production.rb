set :stage, :production
set :rails_env, :production
set :branch, "master"
set :deploy_to, "/home/deploy/deploy/k_api"
server "18.136.67.161", user: "deploy", roles: %w{app db web}
