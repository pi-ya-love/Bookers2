Rails.application.routes.draw do
  # get 'home/top'
  root to: 'home#top'
  get 'home/about'
  # get 'users/show'
  # devise_for :users
  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
  }
  resources :users
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
