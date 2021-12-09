Rails.application.routes.draw do
  resources :books
  resources :users, only:[:index, :show, :edit, :update]
  devise_for :users
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
