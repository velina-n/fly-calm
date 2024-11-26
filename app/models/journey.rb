# app/models/journey.rb
class Journey < ApplicationRecord
  belongs_to :user
  has_many :journeys_fears
  has_many :fears, through: :journeys_fears
  has_many :journeys_documents
  has_many :documents, through: :journeys_documents

  enum status: [:ongoing, :completed]
end
