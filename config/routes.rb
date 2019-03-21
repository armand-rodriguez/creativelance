Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :accounts
  resources :freelancers
  resources :panels
  resources :recruiters
  resources :jobs do
    member do
      patch :close
      patch :open
    end
    resources :requests do
      member do
        patch :reject_request
      end
    end
    resources :job_rooms 
  end
  resources :job_panels
  resources :public_profiles
  resources :requests
  get 'static/index'
  get 'static/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#index'
end
