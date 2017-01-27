Rails.application.routes.draw do
  devise_for :users

  resources :designs, except: [:show]
  root 'designs#index'
  get 'designs/search' => 'designs#search'
  get 'designs/categories' => 'designs#categories'
  get 'users/mypage' => 'users#mypage'
  post 'designs' => 'designs#create'
end