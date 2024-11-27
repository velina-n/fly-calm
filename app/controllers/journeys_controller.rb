# app/controllers/journey_controllers.rb
class JourneysController < ApplicationController
  # Affiche le formulaire pour répondre au questionnaire principal
  # Vue associée : app/views/journeys/new.html.erb
  def new
    # Charge toutes les peurs disponibles pour les afficher dans le formulaire
    @fears = Fear.all
    # Initialise un nouvel objet Journey, utile pour le form_with
    @journey = Journey.new
    # Vue associée automatiquement rendue : app/views/journeys/new.html.erb
  end

  # Traite la soumission du formulaire et crée un nouveau programme personnalisé
  # Redirection ou rendu en cas d'échec :
  # - Vue associée en cas d'échec : app/views/journeys/new.html.erb
  # - Redirection en cas de succès : journey_path(@journey)
  def create
    # Crée un nouveau programme pour l'utilisateur connecté
    @journey = Journey.new(user: current_user, status: :ongoing)

    if @journey.save
      # Associe les peurs sélectionnées au programme
      fear_ids = params[:journey][:fear_ids] || [] # IDs des peurs sélectionnées
      fear_ids.each do |fear_id|
        JourneysFear.create(journey: @journey, fear_id: fear_id)
      end

      # Redirige vers la page de tableau de bord (programme créé avec succès)
      redirect_to journey_path(@journey), notice: "Votre programme a été créé avec succès."
    else
      # Si des erreurs surviennent, réaffiche le formulaire pour corriger
      @fears = Fear.all # Recharge les peurs pour le formulaire
      render :new, status: :unprocessable_entity
    end
  end

  # Affiche le tableau de bord d'un programme personnalisé
  # Vue associée : app/views/journeys/show.html.erb
  def show
    # Charge le programme en fonction de l'ID reçu
    @journey = Journey.find(params[:id])
    # Charge les contenus associés au programme
    @documents = @journey.documents.includes(:journeys_documents)
    # Calcul du pourcentage de progression
    @progress = @journey.progress_percentage
    # Vue associée automatiquement rendue : app/views/journeys/show.html.erb
  end

  # Affiche la page de félicitations lorsque le programme est terminé
  # Vue associée : app/views/journeys/congratulations.html.erb
  def congratulations
    # Charge le programme en fonction de l'ID
    @journey = Journey.find(params[:id])

    if @journey.completed?
      # Si le programme est terminé, affiche la vue de félicitations
      render :congratulations
    else
      # Si le programme n'est pas terminé, renvoie au tableau de bord
      redirect_to journey_path(@journey), alert: "Vous devez terminer le programme avant d'accéder à cette page."
    end
  end
end
