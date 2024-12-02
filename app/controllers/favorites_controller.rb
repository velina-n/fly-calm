class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def toggle
    document = Document.find(params[:document_id])
    favorite = current_user.favorites.find_by(document: document)

    if favorite
      favorite.destroy
      render json: { favorited: false }
    else
      current_user.favorites.create(document: document)
      render json: { favorited: true }
    end
  end
end
