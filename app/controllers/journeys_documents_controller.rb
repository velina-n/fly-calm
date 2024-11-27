# app/controllers/journeys_documents_controller.rb
class JourneysDocumentsController < ApplicationController
  before_action :set_journeys_document, only: [:show, :update, :quiz]

  # Afficher un document spécifique avec son statut
  def show
    # @journeys_document est chargé par le before_action
  end

  # Mettre à jour le statut du document
  def update
    # Tenter de mettre à jour le statut du document
    if @journeys_document.update(journeys_document_params)
      # Rediriger selon le nouveau statut
      case @journeys_document.status
      when "completed"
        redirect_to quiz_journeys_document_path(@journeys_document), notice: "Document terminé ! Passons au quizz."
      when "quizz_done"
        redirect_to @journeys_document, notice: "Quiz complété avec succès !"
      else
        redirect_to @journeys_document, notice: "Statut mis à jour."
      end
    else
      render :show, status: :unprocessable_entity
    end
  end

  # Afficher le quiz du document (uniquement si le statut est `completed`)
  def quiz
    if @journeys_document.completed?
      @question = @journeys_document.document.question # Supposons que chaque document a une question unique
    else
      redirect_to @journeys_document, alert: "Vous devez d'abord terminer ce document avant d'accéder au quiz."
    end
  end

  private

  # Charger le JourneysDocument
  def set_journeys_document
    @journeys_document = JourneysDocument.find(params[:id])
  end

  # Filtrer les paramètres autorisés
  def journeys_document_params
    params.require(:journeys_document).permit(:status)
  end
end
