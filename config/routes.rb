Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :public_working_hours, only: [:index, :show], as: :working_hours
        resources :admin_working_hours, only: [:create, :update, :destroy], as: :working_hour
      end
    end
  end
  
end
