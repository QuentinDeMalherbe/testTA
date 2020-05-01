Rails.application.routes.draw do
  devise_for :users
  root to: 'games#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :games , only: [:index, :show, :new, :create ] do
      resources :parties, only: [ :show, :new, :create] do
        resources :solutions, only: [ :create ]
      end
  end
end
