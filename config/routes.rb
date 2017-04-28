Rails.application.routes.draw do

  devise_for :users

  root  'home#top'
  get '/about' => 'home#about'
  
  #投稿機能のルーティング
  get 'notes/new' => 'notes#new'
  post '/notes' => 'notes#create'
  get 'notes' => 'notes#index'
  get 'notes/:id' => 'notes#show',as: 'note'
  get 'notes/:id/edit' => 'notes#edit', as: 'edit_note'
  patch 'notes/:id' => 'notes#update', as: 'update_note'
  delete 'notes/:id' => 'notes#destroy', as: 'destroy_note'

  #ユーザ登録機能のルーティング
  get 'users/new' => 'users#new'
  post '/users' => 'users#create'
  get 'users' => 'users#index'
  get 'users/:id' => 'users#show',as: 'user'
  get 'users/:id/edit' => 'users#edit', as: 'edit_user'
  patch 'users/:id' => 'users#update', as: 'update_user'
  delete 'users/:id' => 'users#destroy', as: 'destroy_user'







end
