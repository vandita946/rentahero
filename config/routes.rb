Rails.application.routes.draw do

  devise_for :users

  root to: 'superheros#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/dashboard', to: 'bookings#search', as: :dashboard

  resources :bookings do
    resources :reviews, only: [:new, :create]
  end

  resources :superheros do
    resources :bookings, only: [:new, :create, :index]
  end





end
