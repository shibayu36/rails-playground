Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'root#index'
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'
  get '/auth/redirect1' => 'auth0#redirect1'
  get '/auth/redirect2' => 'auth0#redirect2'
  get '/dashboard' => 'dashboard#show'
end
