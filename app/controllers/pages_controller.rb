class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  # Action pour afficher la page d'accueil
  def home
    # Si l'utilisateur est connecté, on affiche son prénom, sinon on invite à se connecter
    @user_name = current_user ? current_user.first_name : "Invité"
    # Le fichier de vue : app/views/pages/home.html.erb
  end
end
