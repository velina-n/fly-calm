# app/models/journey.rb
class Journey < ApplicationRecord
  belongs_to :user
  has_many :journeys_fears
  has_many :fears, through: :journeys_fears
  has_many :journeys_documents
  has_many :documents, through: :journeys_documents

  enum status: [:ongoing, :completed]

  # Calcule le pourcentage de progression
  def progress_percentage
    total_documents = journeys_documents.count
    return 0 if total_documents.zero? # Évite une division par zéro

    completed_documents = journeys_documents.where(status: 'completed').count
    (completed_documents.to_f / total_documents * 100).round(2) # Pourcentage arrondi
  end
end
