class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.integer :kind, null: false, default: 0
      t.string :title
      t.text :content
      t.string :url

      t.timestamps
    end
  end
end
