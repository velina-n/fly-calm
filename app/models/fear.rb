# app/models/fear.rb
class Fear < ApplicationRecord
  has_many :journeys_fears
  has_many :journeys, through: :journeys_fears
  has_many :fears_documents
  has_many :documents, through: :fears_documents
end
