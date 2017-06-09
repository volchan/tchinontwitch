Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :toons, only: [:index, :new, :create, :destroy]
  resources :raids, shallow: true do
    resources :tags
  end
end
