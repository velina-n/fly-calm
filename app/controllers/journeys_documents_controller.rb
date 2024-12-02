# app/controllers/journeys_documents_controller.rb
class JourneysDocumentsController < ApplicationController
  before_action :set_journeys_document, only: [:show, :update, :quizz, :answer, :video]

  # Afficher un document spécifique avec son statut
  def show
    @document = @journeys_document.document
    # @document sera utilisé pour les articles
  end

  # Afficher une vidéo sur une page dédiée
  def video
    @document = @journeys_document.document
    # @document sera utilisé pour les vidéos
  end

   # Marquer une vidéo comme terminée et rediriger vers le quiz
  def complete_video
    if @journeys_document.update(status: "completed")
      redirect_to quizz_journeys_document_path(@journeys_document), notice: "Vidéo terminée ! Passons au quiz."
    else
      redirect_to video_journeys_document_path(@journeys_document), alert: "Impossible de marquer la vidéo comme terminée."
    end
  end

  # Mettre à jour le statut du document
  def update
    if @journeys_document.update(journeys_document_params)
      if @journeys_document.completed?
        redirect_to quizz_journeys_document_path(@journeys_document), notice: "Contenu terminé ! Passons au quiz."
      else
        redirect_to journeys_document_path(@journeys_document), notice: "Statut mis à jour."
      end
    else
      render :show, status: :unprocessable_entity
    end
  end

  # Afficher le quizz du document (uniquement si le statut est `completed`)
  def quizz
    if @journeys_document.completed?
      @question = @journeys_document.document.question # Supposons que chaque document a une question unique
    else
      redirect_to @journeys_document, alert: "Vous devez d'abord terminer ce document avant d'accéder au quizz."
    end
  end

  # Soumettre une réponse pour le quizz
  def answer
    selected_answer = Answer.find_by(id: params[:journeys_document][:answer_id])

    if selected_answer&.right
      # Marque le quizz comme terminé pour une bonne réponse
      @journeys_document.quizz_done!
      flash[:notice] = "Bonne réponse !"
    else
      # Ne marque pas le quizz comme terminé pour une mauvaise réponse
      flash[:alert] = "Mauvaise réponse. Réessayez."
      redirect_to request.referer and return
    end

    redirect_to journey_path(@journeys_document.journey)
  end

  private

  # Charger le JourneysDocument
  def set_journeys_document
    @journeys_document = JourneysDocument.find_by(id: params[:id])
    unless @journeys_document
      redirect_to journey_path, alert: "Le document demandé est introuvable."
    end
  end

  # Filtrer les paramètres autorisés
  def journeys_document_params
    params.require(:journeys_document).permit(:answer_id, :status)
  end
 end
