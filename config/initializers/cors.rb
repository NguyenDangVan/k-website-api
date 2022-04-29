Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*"
    resource "/api/login", methods: %i[post], headers: :any, expose: %w[authorization]
    resource "*", headers: :any, methods: %i[get post patch put]
  end
end
