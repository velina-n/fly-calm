class CreateJourneysDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :journeys_documents do |t|
      t.references :journey, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true
      t.integer :position
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
