class AddColumnsToDocuments < ActiveRecord::Migration[7.1]
  def change
    add_column :documents, :intro, :text
    add_column :documents, :conclusion, :text
    add_column :documents, :image_url, :string
    add_column :documents, :tags, :string, array: true, default: []
    rename_column :documents, :url, :video_url
    add_column :documents, :slug, :string
    remove_column :documents, :content
  end
end
