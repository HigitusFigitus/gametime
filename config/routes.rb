Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only:[:show] do
  	resources :friendships, only:[:create,:index]
  	resources :favorites , only:[:create,:index]
  end

  resources :games, only:[:index,:show] do
  	resources :comments, only:[:new,:create]
  end

  resources :tags, only:[:show]

  root "games#index"
end
