Rails.application.routes.draw do
  devise_for :users, module:"users"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get '/home/about' => 'homes#about', as: 'about'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource  :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:create, :index, :show, :edit, :update]
end
