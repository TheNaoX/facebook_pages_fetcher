Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }


  resources :home, only: [:index] do
    collection { get :enter }
  end

  root to: "home#index"

  namespace :facebook do
    resources :pages, only: [:index, :create, :show] do
      resources :posts, only: [:index]
    end
  end
end
