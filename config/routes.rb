Rails.application.routes.draw do
  # get 'articles/new'
  # get 'articles/index'
  # get 'articles/create'
  # get 'articles/show'
  # get 'articles/destroy'
  # get 'articles/edit'
  # get 'articles/update'
  # get 'tasks/index'
  # get 'tasks/create'
  # get 'tasks/show'
  # get 'tasks/destroy'
  # get 'tasks/edit'
  # get 'tasks/update'
  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/unsubscribe'
  # get 'users/quit_update'
  # get 'homes/top_before_login'
  # get 'homes/top_after_login'
  # get 'homes/about'
  devise_for :users
  get 'root' => 'homes#top_before_login'
  get '/homes/top' => 'homes#top_after_login'
  get '/homes/about' => 'homes#about'
  resources :users, only: [:show, :edit, :update]
  get '/users/:id/unsubscribe' => 'users#unsubscribe'
  patch '/users/:id/quit' => 'users#quit_update'
  # resources :tasks, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :tasks do
    patch '/update_status' =>'tasks#update_status'
    put :sort
  end

  resources :articles do
    resource :favorites, only: [:create, :destroy]
    resources :article_comments, only: [:create, :destroy]
  end

  get 'search' => 'articles#search', as: 'search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
