Rails.application.routes.draw do

  post '/api/v1/auth/login', to: 'api/v1/authentication#login'

  root to: 'api/v1/units_measure#index'
  namespace :api do
    namespace :v1 do
      resources :users, param: :nickname
      resources :units_measure
      resources :categories
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
