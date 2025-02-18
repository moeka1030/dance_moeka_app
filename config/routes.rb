Rails.application.routes.draw do
root 'static_pages#home' #home画面（サインアップかログアウトかのボタン表示）
resources :users, only: [:new, :create]
# resources :sessions, only: [:new, :create, :destroy]

#signupページ
get '/signup', to: 'users#new'
post '/users', to: 'users#create'
#login/logoutページ
get '/login', to: 'sessions#new', as: :login
post '/login', to: 'sessions#create', as: :sessions
delete '/logout', to: 'sessions#destroy', as: :logout

get "up" => "rails/health#show", as: :rails_health_check
end
