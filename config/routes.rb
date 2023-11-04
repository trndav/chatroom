Rails.application.routes.draw do
  resources :rooms
  
  #resources :users
  # or
  get "user/:id", to: "users#show", as: "user"

  root 'pages#home'
  devise_for :users
  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end
end
