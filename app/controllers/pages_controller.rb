class PagesController < ApplicationController
  # Restreindre l'accès aux autres actions sauf splash et home
  before_action :authenticate_user!, except: [:splash, :home]

  def splash
    # Action pour la page de démarrage
  end
  # Action pour afficher la page d'accueil
  def home
    # Si l'utilisateur est connecté, on affiche son prénom, sinon on invite à se connecter
    @user_name = current_user ? current_user.first_name : "Invité"
    # Le fichier de vue : app/views/pages/home.html.erb
  end

  def explorer
    # Action pour la page Explorer
  end

  def consulter
    # Action pour la page Consulter
  end

  def relaxer
    # Action pour la page Se relaxer
  end

  def favoris
    # Action pour la page Favoris
  end
end
