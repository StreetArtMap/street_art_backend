Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # in production change origins to heroku site
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put]
  end
end
