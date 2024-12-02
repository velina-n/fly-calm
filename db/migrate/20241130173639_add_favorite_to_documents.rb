class AddFavoriteToDocuments < ActiveRecord::Migration[7.1]
  def change
    add_column :documents, :favorite, :boolean, default: false
  end
end
