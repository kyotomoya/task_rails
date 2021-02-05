Rails.application.routes.draw do
  get 'reservations/index'
  get 'rooms/index'
  get 'home/index'
  get 'users/show'
  
  
  resources :rooms
  resources :reservations
  
  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }
  root 'home#index'
  get "users/show" => "users#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
