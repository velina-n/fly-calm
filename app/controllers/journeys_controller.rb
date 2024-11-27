class JourneysController < ApplicationController
  # Affiche le formulaire pour répondre au questionnaire principal
  # Vue associée : app/views/journeys/new.html.erb
  def new
    # Charge toutes les peurs disponibles pour les afficher dans le formulaire
    @fears = Fear.all
    # Initialise un nouvel objet Journey pour le formulaire
    @journey = Journey.new
  end

  # Traite la soumission du formulaire et crée un programme personnalisé
  # Vue associée : app/views/journeys/new.html.erb (en cas d'échec)
  def create
    # Initialise un nouveau programme pour l'utilisateur connecté
    @journey = Journey.new(journey_params)
    @journey.user = current_user
    @journey.status = :ongoing

    if @journey.save
      documents = Document.joins(:fears).where(fears: { id: @journey.fears.pluck(:id) }).distinct
      documents.shuffle.first(10).each_with_index do |document, index|
        @journey.journeys_documents.create(document: document, position: index + 1, status: :pending)
      end
      # Redirige vers la page de tableau de bord après création
      redirect_to journey_path(@journey), notice: "Votre programme a été créé avec succès."
    else
      # Recharge les peurs pour réafficher le formulaire en cas d'échec
      @fears = Fear.all
      render :new, status: :unprocessable_entity
    end
  end

  # Affiche le tableau de bord d'un programme personnalisé
  # Vue associée : app/views/journeys/show.html.erb
  def show
    # Charge le programme en fonction de l'ID reçu
    @journey = Journey.find(params[:id])

    # Charge les peurs associées au programme
    @fears = @journey.fears

    # Charge les documents associés aux peurs du programme
    @journey_documents = @journey.journeys_documents.includes(:document)
    @documents = Document.joins(:fears_documents).where(fears_documents: { fear_id: @fears.ids }).distinct
  end

  # Affiche la page de félicitations lorsque le programme est terminé
  # Vue associée : app/views/journeys/congratulations.html.erb
  def congratulations
    # Charge le programme en fonction de l'ID reçu
    @journey = Journey.find(params[:id])

    # Vérifie si le programme est terminé
    if @journey.completed?
      # Affiche la page de félicitations si terminé
      render :congratulations
    else
      # Sinon, renvoie au tableau de bord avec un message d'erreur
      redirect_to journey_path(@journey), alert: "Vous devez terminer le programme avant d'accéder à cette page."
    end
  end

  private

  def journey_params
    params.require(:journey).permit(fear_ids: [])
  end
end
