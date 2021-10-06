# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :families
  resources :village_donations
  resources :patrol_members
  get 'villages/create'
  root 'home#index'
  get '/', to: 'home#index'
  get 'welcome', to: 'home#hello'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resource :villages
end
