# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root 'home#index'
  get '/', to: 'home#index'
  get 'hello', to: 'home#hello'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
end
