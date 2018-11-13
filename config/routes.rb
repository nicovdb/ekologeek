Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'pages#home'
  get '/pourquoi' => 'pages#pourquoi'
  get '/comment' => 'pages#comment'
  get '/soutenir' => 'pages#soutenir'
  get '/partenaires' => 'pages#partenaires'
  get '/plan' => 'pages#plan'
  get '/contact' => 'pages#contact'
  get '/politique' => 'pages#politique_de_confidentialite'
  get 'dossier_de_mecenat', to: "pages#dossier_de_mecenat"
  get 'charte_graphique', to: "pages#charte_graphique"
  get 'logo_RVB', to: "pages#logo_RVB"

  get '/inscription', to: 'companies#new'

  resources :companies

  resources :big_form
  resources :users, only: [:show], path: "utilisateurs"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
