Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "campains#index"

  resources :campains, only: [:index, :show]
end
