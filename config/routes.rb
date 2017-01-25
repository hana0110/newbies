Rails.application.routes.draw do
  devise_for :users
  root 'designs#index'
  get 'designs' => 'designs#index'
  get 'post' => 'designs#post'
  get 'search' => 'designs#search'
  get 'categories' => 'designs#categories'
  get 'mypage' => 'designs#mypage'
end