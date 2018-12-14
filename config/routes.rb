Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/registrations' }

  authenticated :user do
    root :to => 'pages#tableau_de_bord'
  end
  root :to => 'pages#home'

  get '/pourquoi' => 'pages#pourquoi'
  get '/comment' => 'pages#comment'
  get '/soutenir' => 'pages#soutenir'
  get '/partenaires' => 'pages#partenaires'
  get '/plan' => 'pages#plan'
  get '/contact' => 'pages#contact'
  get '/politique' => 'pages#politique_de_confidentialite'
  get '/tableau_de_bord' => 'pages#tableau_de_bord'
  get '/candidature_confirmation' => 'pages#end_of_form'
  get '/post_inscription' => 'pages#post_inscription'
  get 'dossier_de_mecenat', to: "pages#dossier_de_mecenat"
  get 'communique_de_press', to: "pages#communique_de_press"
  get 'charte_graphique', to: "pages#charte_graphique"
  get 'logo_RVB', to: "pages#logo_RVB"
  get 'cgv', to: "pages#cgv"
  get 'destroy_cookies/:id', to: "users#destroy_cookies", as: "destroy_cookies"

  get '/inscription', to: 'companies#new'

  resources :companies

  resources :formulaires

  resources :users, only: [:show, :edit, :update], path: "utilisateurs" do
    member do
      patch "unknown"
      put "unknown"
    end
  end

  resources :bins, only: [:new, :create]
  get "/donnees", to: "collects#index", as: "donnees"
  resources :collects, only: [:new, :create, :edit, :update, :destroy]
  resources :trash_diagnostics, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
