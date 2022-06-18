#set phương thức ssh = public key (đây là lý do mà mình cần gen ssh-key cho deploy ngoại trừ việc up lên github)
set :ssh_options, {
  keys: %w(~/.ssh/id_rsa),
  forward_agent: true,
  port: 22,
  user: 'deploy',
}

# role :name, %{[user]@[IP adde.]}
role :app, %w{deploy@18.138.186.29}
role :web, %w{deploy@18.138.186.29}
role :db,  %w{deploy@18.138.186.29}

# Define server(s)
server '18.138.186.29', user: 'deploy', roles: %w{web}


# set :stage, :production
# set :rails_env, :production
# set :branch, "main"
# set :deploy_to, "/home/deploy/deploy/k_api"
# server "18.138.186.29", user: "deploy", roles: %w{app db web}

# set :default_env, {
#   "SECRET_KEY_BASE" => ENV["SECRET_KEY_BASE"]
# }
