class CreateFears < ActiveRecord::Migration[7.1]
  def change
    create_table :fears do |t|
      t.string :name

      t.timestamps
    end
  end
end
