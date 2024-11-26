class CreateJourneysFears < ActiveRecord::Migration[7.1]
  def change
    create_table :journeys_fears do |t|
      t.references :journey, null: false, foreign_key: true
      t.references :fear, null: false, foreign_key: true

      t.timestamps
    end
  end
end
