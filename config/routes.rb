Rails.application.routes.draw do
  devise_for :users
  root 'designs#index'
  get 'designs' => 'designs#index'
  get 'new' => 'designs#new'
  get 'search' => 'designs#search'
  get 'categories' => 'designs#categories'
  get 'mypage' => 'users#mypage'
end