# app/models/question.rb
class Question < ApplicationRecord
  belongs_to :document
  has_many :answers
end
