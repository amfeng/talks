Railsbook::Application.routes.draw do

  # Registration & sessions

  # FIXME change /register to /signup
  get   "register" => "users#new",             :as => :register
  post  "register" => "users#create"

  get   "login"    => "user_sessions#new",     :as => :login
  match "logout"   => "user_sessions#destroy", :as => :logout

  post "friend" => "users#friend", :as => :friend
  post "unfriend" => "users#unfriend", :as => :unfriend

  # FIXME Add routes for comments

  get   '/' => 'home#index', :as => :home

  resources :users
  resources :posts
  resources :user_sessions

  root :to => 'home#index'

end
