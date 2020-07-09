Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    get 'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    delete 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

  namespace :admin do
    get "game" => "edits#game"
    patch "game" => "edits#game_update"

    resources :posts
    resources :players
    resources :teams, only: [:show,:edit,:update,:destroy]
    resources :schedules, only: [:new,:edit,:update,:create,:destroy]
  end

  get "/article"  => "home#article"
  get "/about"    => "home#about"
  get "/schedule" => "home#schedule"
  get "/schedule/:id" => "home#schedule_show"
  get "/member"   => "home#member"
  get "/acssess"  => "home#acssess"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#top'
end
