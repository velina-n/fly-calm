# app/models/answer.rb
class Answer < ApplicationRecord
  belongs_to :question
  validates :text, presence: true
  def right?
    self.right
  end
end
