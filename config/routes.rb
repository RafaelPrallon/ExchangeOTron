Rails.application.routes.draw do
  root 'exchanges#index'
  get 'convert', to: 'exchanges#exchange'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
