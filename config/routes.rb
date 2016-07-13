Rails.application.routes.draw do
  
  root "projects#index"
  devise_for :users
  resources :users, :only => [:show]

  namespace :admin do
    root :to => "base#index"
    resources :assignments   
  end
  
  get "/join", to: "users#join"
  get "/unjoin", to: "users#unjoin"

  get "/my_teams", to: "users#my_teams"
  get "/my_tasks", to: "users#my_tasks"
  get "/my_projects", to: "users#my_projects"

  get "/remove_project", to: "teams#remove_project"
  
  post "/posts/:post_id/comments", to: "comments#add_comment", as: 'post/comments'

  resources :projects do
    resources :tasks do
      resources :comments
    end
    resources :posts
    resources :teams
  end

  resources :tasks
  resources :posts
  resources :comments

  resources :teams do
    resources :projects
  end
end
