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
  post "get_city" => "tenants#get_city"
  post "get_apts" => "tenants#get_apts"
  post "get_units" => "tenants#get_units"
  post "associate_tenant" => "tenants#associate_tenant"

  resources :properties
  resources :users
  resources :property_owners, controller: 'users', user_designation: 'PropertyOwner'
  resources :tenants, controller: 'users', user_designation: 'Tenant'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
