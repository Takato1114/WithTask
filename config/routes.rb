Rails.application.routes.draw do
  devise_for :users
  get '' => 'homes#top_before_login'
  get '/homes/top' => 'homes#top_after_login'
  get '/homes/about' => 'homes#about'
  resources :users, only: [:show, :edit, :update]
  get '/users/:id/unsubscribe' => 'users#unsubscribe'
  patch '/users/:id/quit' => 'users#quit_update'
  resources :tasks, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
