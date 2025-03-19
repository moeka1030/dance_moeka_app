Rails.application.routes.draw do

  root 'static_pages#home'

  get '/posts/index', to: 'posts#index',as: :post_index  #投稿一覧ページ（indexのパス使用で分かりやすく）

  resources :posts do
    resources :likes, only: [:create, :destroy]
  end

  resources :likes, only: [:index] # いいね一覧

  devise_for :users, controllers: { #カスタム使用の指定
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  get '/users/profile', to: 'users#show', as: :user_profile # プロフィールページ
end
  
  
