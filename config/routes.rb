Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  devise_for :users
  get '/', to: 'pages#home', as: 'home'
  root to: 'pages#home'
  resources :experiences do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, except: [:new, :create] do
    member do
      # bookings/id/accept
      get 'accept', to: 'bookings#accept'
      # bookings/id/decline
      get 'decline', to: 'bookings#decline'
    end
  end
  get '/my_experiences', to: 'users#my_experiences', as: 'my_experiences'
  get '/my_hostings', to: 'bookings#my_hostings', as: 'my_hostings'
  resources :users, only: [:show, :edit, :update]
end
