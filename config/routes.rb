Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :dashboard do
    resources :service_requests, only: :index
    resources :service_types, only: :index
  end
end
