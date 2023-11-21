Rails.application.routes.draw do
  resources :controllers
  post '/login', to: 'authentication#login'
  delete '/logout', to: 'authentication#logout'
  post '/signup/user', to: 'authentication#signup_user'
  post '/signup/admin', to: 'authentication#signup_admin'
  post '/signup/seller', to: 'authentication#signup_seller'
  
  get 'up' => 'rails/health#show', as: :rails_health_check
end
