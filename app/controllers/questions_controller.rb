class QuestionsController < ApplicationController
  def index
    @questions = Question.where(document_id: params[:document_id])
  end

  def show
    @question = Question.find(params[:id])
  end
end
