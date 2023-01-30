Rails.application.routes.draw do
  get 'users/show', to: 'users#show'

  resources :events

  devise_for :users
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
