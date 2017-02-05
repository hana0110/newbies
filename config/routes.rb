Rails.application.routes.draw do
  devise_for :users
  root 'designs#index'
  resources :designs, except: [:show] do
      collection do
        get 'search'
      end
      member do
        post "add", to: "favorites#create"
      end
    end

  resources :favorites, only: [:destroy]

  get 'designs/browse' => 'designs#browse'
  get 'users/mypage' => 'users#show'
  get 'users/settings' => 'users#setting'
  post 'designs' => 'designs#create'
  get'designs/:id' => 'designs#show'
end