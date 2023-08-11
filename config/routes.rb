Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :user, only: [] do
    resources :groups, only: [:index, :new, :create] do
      resources :movements, only: [:index, :new, :create]
    end
  end
end
