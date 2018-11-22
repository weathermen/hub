Rails.application.routes.draw do
  resources :instances, except: :index
  root to: 'instances#index'
end
