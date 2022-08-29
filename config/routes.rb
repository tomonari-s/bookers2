Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update, :index]
  root to: 'homes#top'
  get "home/about" => "homes#about", as: "about"
  get "users/:id/edit" => "users#edit"
  resources :books, only: [:new, :create, :index, :show, :edit, :update,:destroy] do
    resource :favorites, only: [:create, :destroy]
    
    resources :book_comments, only: [:create, :destroy]
  end
  
  
end
