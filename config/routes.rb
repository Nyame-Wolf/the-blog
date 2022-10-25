Rails.application.routes.draw do
 root 'authors#index'
  get 'authors/index'
  resources :authors, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
