# app/controllers/journeys_documents_controller.rb
class JourneysDocumentsController < ApplicationController
  before_action :set_journeys_document, only: [:show, :update, :quizz, :answer]

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
        redirect_to quizz_journeys_document_path(@journeys_document), notice: "Document terminé ! Passons au quizz."
      when "quizz_done"
        redirect_to @journeys_document, notice: "Quizz complété avec succès !"
      else
        redirect_to @journeys_document, notice: "Statut mis à jour."
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
    # Récupérer l'ID de la réponse sélectionnée depuis le formulaire
    selected_answer_id = journeys_document_params[:answer_id]

    # Logique pour traiter la réponse soumise (ici, uniquement affichage d'un message)
    if selected_answer_id.present?
      flash[:notice] = "Réponse soumise avec succès ! Vous avez choisi la réponse ##{selected_answer_id}."
    else
      flash[:alert] = "Aucune réponse sélectionnée."
    end

    # Rediriger vers le dashboard des documents (journeys#show)
    redirect_to journey_path(@journeys_document.journey_id), notice: "Retour au dashboard des documents."
  end

  private

  # Charger le JourneysDocument
  def set_journeys_document
    @journeys_document = JourneysDocument.find(params[:id])
  end

  # Filtrer les paramètres autorisés
  def journeys_document_params
    params.require(:journeys_document).permit(:answer_id, :status)
  end
end
