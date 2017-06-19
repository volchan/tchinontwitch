Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users
  root to: 'pages#home'
  resources :toons, only: %i[index new create update destroy]
  resources :raids, shallow: true do
    get :render_cable_card
    resources :tags, only: %i[new create update destroy]
  end
end
