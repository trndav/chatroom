Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end
  
  root 'pages#home'
  devise_for :users
  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end

  #resources :users
  # or
  get "user/:id", to: "users#show", as: "user"
end
