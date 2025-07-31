Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://searchenginefe-production.up.railway.app'

    resource '*',
      headers: :any,
      methods: [:get, :post, :options]
  end
end
