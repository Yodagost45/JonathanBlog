Rails.application.routes.draw do
  User.connection
  devise_for :users
  root 'pages#home'
  resources :users do
    resources :goals
  end
end
