Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :users, only: [:index, :show, :update, :destroy]
        resources :working_hours, only: [:index, :show, :create, :update]
        resources :slots, only: [:index, :show, :create, :update, :destroy]
        resources :reservations, only: [:index, :create, :destroy]
      end
    end
  end
  
    # Define routes for admin users
    namespace :admin, path: 'api/v1', constraints: { user_role: 'admin' } do
      resources :users
      resources :working_hours, only: [:create, :update]
      resources :slots, only: [:create, :update, :destroy]
    end
  
    # Define routes for non-admin users
    namespace :user, path: 'api/v1', constraints: { user_role: 'default' } do
      resources :reservations, only: [:index, :create, :destroy]
    end
end
