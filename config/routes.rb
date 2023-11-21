Rails.application.routes.draw do
  post '/login', to: 'authentication#login'
  delete '/logout', to: 'authentication#logout'
  post '/signup/user', to: 'authentication#signup_user'
  post '/signup/admin', to: 'authentication#signup_admin'
  
  get "up" => "rails/health#show", as: :rails_health_check
  
end
