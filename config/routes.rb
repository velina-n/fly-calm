# config/routes.rb
Rails.application.routes.draw do
  get 'relaxer/index'
  devise_for :users # Gestion des utilisateurs avec Devise

  # Page de démarrage
  root 'pages#splash'

  # Page d'accueil
  get '/home', to: "pages#home", as: :home

  # Gestion des icones de la barre de navigation
  get "/explorer", to: "pages#explorer", as: :explorer
  get "/consulter", to: "pages#consulter", as: :consulter
  get "/favoris", to: "pages#favoris", as: :favoris

  # Gestion des pages de relaxation
  get 'relaxer', to: 'relaxer#index'
  get 'relaxer/circle', to: 'relaxer#circle'
  get 'relaxer/bar', to: 'relaxer#bar'

  # Gestion des consultations
  get '/calendly', to: 'pages#calendly', as: :calendly


  # Gestion des programmes (Journeys)
  resources :journeys, only: [:new, :create, :show] do
    # Gestion des peurs associées aux programmes
    resources :journeys_fears, only: [:index, :create, :destroy]
    # Route pour la page de félicitations
    member do
      get 'congratulations'
    end
  end
  # Gestion des documents associés à un programme
  resources :journeys_documents, only: [:show, :update], controller: :journeys_documents do
    member do
      get :quizz # Route pour afficher le quizz à la fin d'un document
      patch :answer # Route pour soumettre une réponse à un quizz
      get :video # Pour la page dédiée à la vidéo
    end
  end

  # Gestion des documents
  resources :documents, only: [:index, :show] do
    member do
      post :toggle_favorite # Route pour ajouter ou retirer un document des favoris
    end
    # Questions associées à un document
    resources :questions, only: [:index, :show]
  end

  # Gestion des questions et réponses globales
  resources :questions, only: [:show]
  resources :answers, only: [:index, :show]

  # Gestion des peurs
  resources :fears, only: [:index, :show, :create, :update, :destroy]

  # Gestion des favoris
  resources :favorites, only: [] do
    post 'toggle', on: :collection
  end
end
