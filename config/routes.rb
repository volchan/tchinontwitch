Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :dungeons
    resources :raids
    resources :realms
    resources :tags
    resources :toons

    root to: "users#index"
  end

  mount ActionCable.server => '/cable'

  devise_for :users

  root to: 'pages#home'

  resources :toons, only: %i[index new create update destroy]

  resources :raids, shallow: true do
    get :render_cable_card
    get :show_roster_list
    get :edit_tag
    resources :tags, only: %i[new create update destroy]
  end
end
