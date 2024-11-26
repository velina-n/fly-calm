class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :text
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
