Rails.application.routes.draw do
  devise_for :users
  resources :instances, except: :index
  root to: 'instances#index'
end
