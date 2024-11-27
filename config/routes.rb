# config/routes.rb
Rails.application.routes.draw do
  devise_for :users # Gestion des utilisateurs avec Devise

  root to: "pages#home" # Page d'accueil

  resources :journeys do
    resources :journeys_documents, only: [:show, :update] do
      member do
        get :quiz # Route pour afficher le quiz
      end
    end
    resources :journeys_fears, only: [:index, :create, :destroy]
  end

  resources :documents do
    resources :questions, only: [:index, :show]
  end

  resources :fears
  resources :questions
  resources :answers
end
