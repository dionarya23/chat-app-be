Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://chat-app-fe-beta-pied.vercel.app'  # Remove the trailing slash

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
