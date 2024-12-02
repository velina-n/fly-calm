# /app/controllers/documents_controller.rb
class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def show
    @document = Document.find(params[:id])
  end

  def toggle_favorite
    document = Document.find(params[:id])

    if current_user.favorite_documents.include?(document)
      current_user.favorites.find_by(document: document).destroy
      render json: { status: 'removed', document_id: document.id }
    else
      current_user.favorites.create(document: document)
      render json: { status: 'added', document_id: document.id }
    end
  end
end
