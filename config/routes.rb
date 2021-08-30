Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'books#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  get 'logout', to: 'session#destroy'
  post 'checkout', to: 'carts#checkout'

  resources :users, only:[:new, :create, :edit, :update]
  resources :books, only:[:index, :new]
  resources :buy, only:[:new]
  resources :carts, only:[:show, :destroy]
  resources :cart_books, only:[:create, :destroy]
  resources :sales, only:[:index]
  
end
