Rails.application.routes.draw do
  get 'static_pages/home'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
root 'static_pages#home' #home画面（サインアップかログアウトかのボタン表示）
resources :users, only: [:new, :create]
resources :sessions, only: [:new, :create, :destroy]
delete '/logout', to: 'sessions#destroy'
get "up" => "rails/health#show", as: :rails_health_check

#signupページ
get '/signup', to: 'users#new'
post '/users', to: 'users#create'
end
