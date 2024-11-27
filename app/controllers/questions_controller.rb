class QuestionsController < ApplicationController
  def index
    @questions = Question.where(document_id: params[:document_id])
  end

  def show
    @document = @question.document # Charger le document associé
  end
end
