Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', confirmations: 'confirmations' }
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
    resources :tasks do
      member do
        patch :accept
        patch :reject
      end
    end
  end
  resources :tasks do
    resources :submissions
  end
  resources :job_panels
  resources :public_profiles
  resources :requests
  get 'static/index'
  get 'static/contact'
  get 'my_jobs/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#index'
end
