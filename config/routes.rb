Rails.application.routes.draw do
  get 'maintanence_service/index'

  get 'maintanence_service/new'

  post '/tenants/maintanence_services' => "maintanence_service#create"

  get 'maintanence_service/show'

  get 'workspace/index'

  root "sessions/sessions#index"
  namespace :sessions do
     resources :sessions
  end

  get "users" => "users#new", :as => "users"
  get "new_user_sign_up" => "users#new", :as => "new_user_sign_up"
  get "user_logged_out" => "sessions/sessions#destroy", :as => "user_logged_out"
  get "property_owners/PropertyOwner" => "property_owners#show", :as => "property_owner_workspace"
  get "tenants/Tenant" => "tenants#show", :as => "tenant_workspace"

  resources :properties
  resources :users
  resources :property_owners, controller: 'users', type: 'PropertyOwner'
  resources :tenants, controller: 'users', type: 'Tenant'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
