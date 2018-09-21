Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/pourquoi' => 'pages#pourquoi'
  get '/comment' => 'pages#comment'
  get '/inscription' => 'pages#inscription'
  get '/soutenir' => 'pages#soutenir'
  get '/partenaires' => 'pages#partenaires'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
