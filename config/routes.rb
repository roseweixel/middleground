Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resource :login, only: [:create], controller: :sessions
      resources :users, only: [:create]
      resources :locations, only: [:create]
    end
  end
end
