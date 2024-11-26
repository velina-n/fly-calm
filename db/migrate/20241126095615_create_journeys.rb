class CreateJourneys < ActiveRecord::Migration[7.1]
  def change
    create_table :journeys do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
