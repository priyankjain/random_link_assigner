Rails.application.routes.draw do
  get 'home' => 'links#show', :as => 'home'
  get 'login' => 'sessions#new', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'register' => 'users#new', :as => 'register'
  resource :users
  resources :sessions
end
