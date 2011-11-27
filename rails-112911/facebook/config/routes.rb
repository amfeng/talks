Facebook::Application.routes.draw do

  # Registration & sessions
  get   "register" => "users#new",             :as => :register
  get   "login"    => "user_sessions#new",     :as => :login
  match "logout"   => "user_sessions#destroy", :as => :logout

  resources :users
  resources :user_sessions

  root :to => 'home#index'

end
