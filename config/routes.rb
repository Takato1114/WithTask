Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  get '/' => 'homes#top_before_login'
  get '/homes/top' => 'homes#top_after_login'
  get '/homes/about' => 'homes#about'
  get '/users/mypage' => 'users#mypage'
  get '/users/unsubscribe' => 'users#unsubscribe'
  resources :users, only: [:show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  # resources :tasks, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :tasks do
    patch '/update_status' =>'tasks#update_status'
    put :sort
  end

  resources :articles do
    resource :favorites, only: [:create, :destroy]
    resources :article_comments, only: [:create, :destroy]
  end

  get 'task/search' => 'tasks#search', as: 'tasks_search'
  get 'article/search' => 'articles#search', as: 'articles_search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
