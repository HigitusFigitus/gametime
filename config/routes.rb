Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:show] do
  	resources :friendships, only:[:create,:destroy]
  	resources :favorites , only:[:create,:destroy]
  end

  resources :games, only:[:index,:show,:update] do
  	resources :comments, only:[:new,:create]
  end

  resources :tags, only:[:show]

  resources :search, only: :index

  root "games#index"
end
