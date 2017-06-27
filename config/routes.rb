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

  resources :users, only: %i[note update_note] do
    get :note, to: 'users#note'
    patch :update_note, to:'users#update_note'
  end

  root to: 'pages#home'

  resources :toons, only: %i[index new create update destroy]

  resources :raids, shallow: true do
    get :render_cable_card
    get :show_roster_list
    get :edit_tag
    resources :tags, only: %i[new create update destroy] do
      get :show_note
      get :delete_tag
    end
  end
end
