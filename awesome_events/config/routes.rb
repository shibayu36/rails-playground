Rails.application.routes.draw do
  resources :events
  root 'welcome#index'
  get '/auth/:provider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :events do
    resources :tickets
  end

  constraints(host: 'domain1.shibayu36.localhost') do
    get '/constraints/hoge', to: 'constraints#hoge', as: 'domain1_constraints_hoge'
  end

  constraints(host: 'domain2.shibayu36.localhost') do
    get '/constraints/hoge', to: 'constraints#hoge', as: 'domain2_constraints_hoge'
  end

  constraints(host: ['domain1.shibayu36.localhost', 'domain2.shibayu36.localhost']) do
    get '/constraints/fuga', to: 'constraints#fuga', as: 'constraints_fuga'
  end

  # 以下のような書き方はできない
  # constraints(host: 'domain1.shibayu36.localhost') do
  #   get '/constraints/piyo', to: 'constraints#piyo', as: 'constraints_piyo'
  # end
  # constraints(host: 'domain2.shibayu36.localhost') do
  #   get '/constraints/piyo', to: 'constraints#piyo', as: 'constraints_piyo'
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
