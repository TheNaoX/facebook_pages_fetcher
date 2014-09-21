Rails.application.routes.draw do
  resources :home, only: [:index]

  root to: "home#index"

  namespace :facebook do
    resources :pages, only: [:index, :create, :show] do
      resources :posts, only: [:index]
    end
  end
end
