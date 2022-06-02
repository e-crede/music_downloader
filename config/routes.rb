Rails.application.routes.draw do
  resources :delete_mes

  root 'processors#index'
  get 'convert', to: 'processors#convert'
  get 'status', to: 'processors#status'
end
