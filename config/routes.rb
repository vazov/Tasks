Rails.application.routes.draw do

  root "projects#index"

  namespace :admin do
    root :to => "base#index"
    resources :assignments   
  end

  resources :posts

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy"

  resources :users

  resources :projects do
    resources :tasks
    resources :teams
  end

  resources :teams do
    resources :projects
  end

end
