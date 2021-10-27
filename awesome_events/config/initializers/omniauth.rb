Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.development? || Rails.env.test?
    provider :github, '2bd757fe045425ef18a3', 'd61e13d33f27e518a9d4b350709f9d4565679c41'
  else
    provider :github, Rails.application.credentials.github[:client_id],
             Rails.application.credentials.github[:client_secret]
  end
end
