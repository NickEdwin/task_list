Rails.application.routes.draw do
  root to: "welcome#index"

  resources :users, only: [:new, :create]

  resources :tasks
  get "/tasks/:id/status" => "tasks#status"

  resources :tags
end
