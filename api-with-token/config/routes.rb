Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'token', to: 'authentication#token'
      resources :trips, only: [:index]
    end
  end
end
