Rails.application.routes.draw do
  get 'users/show', to: 'users#show'
  post 'events/create', to: 'events#create'
  get 'events/new', to: 'events#new'

  devise_for :users
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  get 'events/index', to: 'events#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
