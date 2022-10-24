Rails.application.routes.draw do
  get 'authors/show'
  get 'authors/index'
  root 'authors#index'
  resources :authors, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
    end
  end
  # get 'posts/index'
  # get 'posts/show'
  # get 'users/show'
  # get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
