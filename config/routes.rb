Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "products#index"
  resources :products, only: %i[show edit update] do
    resources :order_items, only: %i[create update destroy]
  end

  resources :orders

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
