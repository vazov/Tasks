Rails.application.routes.draw do

  resources :comments
  root "projects#index"

  namespace :admin do
    root :to => "base#index"
    resources :assignments   
  end

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy"

  get "/join", to: "users#join"
  get "/unjoin", to: "users#unjoin"

  get "/my_teams", to: "users#my_teams"
  get "/my_tasks", to: "users#my_tasks"
  get "/my_projects", to: "users#my_projects"

  get "/remove_project", to: "teams#remove_project"
  
  post "/posts/:post_id/comments", to: "comments#add_comment", as: 'post/comments'
  resources :users

  resources :projects do
    resources :tasks do
      resources :comments
    end
    resources :teams
    resources :posts
  end

  resources :posts

  resources :tasks

  resources :teams do
    resources :projects
  end

end
