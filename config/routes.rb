Rails.application.routes.draw do

  root 'processors#index'
  get 'convert', to: 'processors#convert'
  get 'status', to: 'processors#status'
end
