Rails.application.routes.draw do
  devise_for :users
  root to: 'experiences#index'
  resources :experiences do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, except: [:new, :create]
  get '/my_experiences', to: 'users#my_experiences', as: 'my_experiences'
  get '/my_hostings', to: 'bookings#my_hostings', as: 'my_hostings'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
