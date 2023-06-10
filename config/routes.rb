Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        devise_for :users, controllers: {
          sessions: 'api/v1/sessions',
          registrations: 'api/v1/registrations'
        }
        resources :users, only: [:index, :show, :update, :destroy]
        resources :working_hours, only: [:index, :show, :create, :update]
        resources :slots, only: [:index, :show, :create, :update, :destroy]
        resources :reservations, only: [:index, :create, :destroy]
        post '/users/sign_up', to: 'registrations#create' # Add this line for user registration
        get '/csrf-token', to: 'csrf_tokens#show'
        get '/auth/validate_token', to: 'auth#validate_token'
      end
    end
  end
  
  # Define routes for admin users
  # namespace :admin, path: 'api/v1', constraints: { user_role: 'admin' } do  
  #   resources :users
  #   resources :working_hours, only: [:create, :update]
  #   resources :slots, only: [:create, :update, :destroy]
  # end
  
  # Define routes for non-admin users
  # namespace :user, path: 'api/v1', constraints: { user_role: 'default' } do
  #   resources :reservations, only: [:index, :create, :destroy]
  # end
end
