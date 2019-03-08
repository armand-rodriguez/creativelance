Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :accounts
  get 'static/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#index'
end
