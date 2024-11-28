# config/routes.rb
Rails.application.routes.draw do
  devise_for :users # Gestion des utilisateurs avec Devise

  # Page d'accueil
  root to: "pages#home", as: :home

  # Gestion des icones de la barre de navigation
  get "/explorer", to: "pages#explorer", as: :explorer
  get "/consulter", to: "pages#consulter", as: :consulter
  get "/relaxer", to: "pages#relaxer", as: :relaxer
  get "/favoris", to: "pages#favoris", as: :favoris

  # Gestion des programmes (Journeys)
  resources :journeys, only: [:new, :create, :show] do
    # Gestion des peurs associées aux programmes
    resources :journeys_fears, only: [:index, :create, :destroy]

    # Gestion des documents associés à un programme
  end
  resources :journeys_documents, only: [:show, :update], controller: :journeys_documents do
    member do
      get :quizz # Route pour afficher le quizz à la fin d'un document
      patch :answer # Route pour soumettre une réponse à un quizz
      get :video # Pour la page dédiée à la vidéo
    end
  end

  # Gestion des documents
  resources :documents, only: [:index, :show] do
    # Questions associées à un document
    resources :questions, only: [:index, :show]
  end

  # Gestion des questions et réponses globales
  resources :questions, only: [:show]
  resources :answers, only: [:index, :show]

  # Gestion des peurs
  resources :fears, only: [:index, :show, :create, :update, :destroy]


end
