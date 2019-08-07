Rails.application.routes.draw do
  User.connection
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  root 'pages#home'
  resources :users do
    resources :goal_sections
  end
  resources :goal_sections do
    resources :goals
  end
end
