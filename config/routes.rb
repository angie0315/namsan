Rails.application.routes.draw do
  resources :trades do
    resources :replies, only: [:create, :destroy]
    collection do
      get 'clothes'
      get 'books'
      get 'rests'
    end
  end
  devise_for :users
  root 'home#index'
  resources :cards do
    resources :replies, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
