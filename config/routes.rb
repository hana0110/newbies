Rails.application.routes.draw do
  devise_for :users
  root 'designs#index'
  get 'designs' => 'designs#index'
  get 'designs/new' => 'designs#new'
  get 'designs/search' => 'designs#search'
  get 'designs/categories' => 'designs#categories'
  get 'users/mypage' => 'users#mypage'
  post 'designs' => 'designs#create'
end