Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :dashboard do
    resources :service_requests, only: :index do
      collection do
        get :stat, action: :show, controller: 'service_requests/stat'
      end
    end
    resources :service_types, only: :index
    resources :premises, only: :index
    resources :activity_feeds, only: :index
  end

  resources :premises, only: [:index, :update]
end
