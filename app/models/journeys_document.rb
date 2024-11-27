# app/models/journey_document.rb
class JourneysDocument < ApplicationRecord
  belongs_to :journey
  belongs_to :document

  enum status: [:pending, :completed, :quizz_done]
  validates :position, presence: true
end
