  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
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
        post '/users/logout', to: 'users#logout' 
        get '/api/v1/users/logged_in_user_id', to: 'api/v1/users#logged_in_user_id'

      end
    end
end
