Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/', to: "home#show"
   root to: "home#show"

  get '/games', to: "games#index"
  get '/platforms', to: "platforms#index"
  get '/companies', to: "companies#index"

  namespace :maps do
    get '/companies', to: "companies#index"
  end

  namespace :platforms do
    get '/sales', to: "sales#index"
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/platforms', to: "platforms#index"
      get '/companies', to: "companies#index"
      get '/games', to: "games#index"
    end
  end

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  get "/logout", to: "sessions#destroy", as: "github_logout"

end
