Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/pourquoi' => 'pages#pourquoi'
  get '/comment' => 'pages#comment'
  get '/inscription' => 'pages#inscription'
  get '/soutenir' => 'pages#soutenir'
  get '/partenaires' => 'pages#partenaires'
  get 'dossier_de_mecenat', to: "pages#dossier_de_mecenat"
  get 'charte_graphique', to: "pages#charte_graphique"
  get 'logo_RVB', to: "pages#logo_RVB"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
