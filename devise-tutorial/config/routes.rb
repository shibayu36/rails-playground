Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: 'home#index'
  get '/privacy' => 'privacy#index'
  get '/my' => 'my#index'
  get '/my/destroy' => 'my#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
