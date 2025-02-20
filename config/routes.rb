Rails.application.routes.draw do
root 'static_pages#home' #home画面（サインアップかログアウトかのボタン表示）
resources :users, only: [:new, :create, :show, :edit, :update] #:show, :edit, :updateはプロフィールの機能
resources :posts
resources :posts do
  resources :like, only: [:create, :destroy]
end
resources :likes, only: [:index] #いいね一覧画面（タブ２）

#signupページ
get '/signup', to: 'users#new'
post '/users', to: 'users#create'
#login/logoutページ
get '/login', to: 'sessions#new', as: :login #as以下はヘルパーメソッド（＿path）を生成
post '/login', to: 'sessions#create', as: :sessions
delete '/logout', to: 'sessions#destroy', as: :logout


get "up" => "rails/health#show", as: :rails_health_check
end
