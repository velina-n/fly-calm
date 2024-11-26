class CreateFearsDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :fears_documents do |t|
      t.references :fear, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
