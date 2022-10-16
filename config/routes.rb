Rails.application.routes.draw do
  devise_for :users, module:"users"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:create, :index, :show, :edit, :update]
  get '/home/about' => 'homes#about', as: 'about'
end
