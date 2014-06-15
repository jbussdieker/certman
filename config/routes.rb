Certman::Application.routes.draw do
  resources :certificates

  resources :certificate_requests

  resources :private_keys

  root :to => 'private_keys#index'
end
