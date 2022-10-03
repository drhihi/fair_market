Rails.application.routes.draw do
  devise_for :users
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "products#index"
  resources :products, except: %i[new destroy] do
    resources :order_items, only: %i[create update destroy]
    collection do
      post 'fetch_products', as: :fetch
    end
  end

  resources :orders do
    collection do
      get :checkout
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
