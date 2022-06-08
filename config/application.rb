require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FivemintubBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.secret_key_base = '<%= ENV["SECRET_KEY_BASE"] %>'
    excluded_routes = ->(env) { !env["PATH_INFO"].match(%r{^/api}) }
    config.middleware.use OliveBranch::Middleware,
                          inflection: "camel",
                          exclude_params: excluded_routes,
                          exclude_response: excluded_routes
  end
end
