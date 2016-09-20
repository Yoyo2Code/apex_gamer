Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :maps do
    get '/companies', to: "companies#show"
  end

  get '/', to: "home#show"

  # get '/auth/github', as: :github_login
  # get '/auth/github/callback', to: 'sessions#create'
  # get "/logout", to: "sessions#destroy", as: "github_logout"

end
