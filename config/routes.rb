Rails.application.routes.draw do
  root "sessions/sessions#index"
  namespace :sessions do
     resources :sessions
#    get 'sessions/index'
  end

  get "users" => "users#new", :as => "users"
  get "new_user_sign_up" => "users#new", :as => "new_user_sign_up"
  get "user_logged_out" => "sessions/sessions#destroy", :as => "user_logged_out"
  resources :properties
  resources :users
  resources :propertiy_owners, controller: 'users', type: 'PropertyOwner'
  resources :tenant, controller: 'users', type: 'Tenant'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
