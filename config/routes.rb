Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :toons, only: %i[index new create destroy]
  resources :raids, shallow: true do
    resources :tags, only: %i[new create update destroy]
  end
end
