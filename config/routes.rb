Rails.application.routes.draw do
  devise_for :users
  root to: 'experiences#index'
  resources :experiences do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, except: [:new, :create]
  get '/my_experiences', to: 'users#my_experiences', as: 'my_experiences'
  resources :users, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
