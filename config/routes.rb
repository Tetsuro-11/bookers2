Rails.application.routes.draw do
  resources :books do
    resource :favorites, only: [:create, :destroy]
  end
  devise_for :users
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
      
  resources :users, only:[:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
