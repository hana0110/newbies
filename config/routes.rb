Rails.application.routes.draw do
  devise_for :users
  resources :designs, except: [:show] do
      collection do
        get 'search'
      end
    end
  get 'designs/categories' => 'designs#categories'
  get 'users/mypage' => 'users#mypage'
  post 'designs' => 'designs#create'
  root 'designs#index'
  get'designs/:id' => 'designs#show'
end