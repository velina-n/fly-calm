class AddRightAnswerToAnswers < ActiveRecord::Migration[7.1]
  def change
    add_column :answers, :right, :boolean, default: false
  end
end
