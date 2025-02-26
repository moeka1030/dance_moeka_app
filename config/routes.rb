
Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  #homeページ
  get '/posts/index', to: 'posts#index',as: :post_index
  # プロフィールページ
  get '/users/profile', to: 'users#show', as: :user_profile

  root 'static_pages#home'
  resources :posts do
    resources :like, only: [:create, :destroy]
  end
  resources :likes, only: [:index]
end

