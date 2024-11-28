# app/models/fear.rb
class Fear < ApplicationRecord
  has_many :journeys_fears, dependent: :destroy
  has_many :journeys, through: :journeys_fears
  has_many :fears_documents, dependent: :destroy
  has_many :documents, through: :fears_documents

  validates :name, presence: true
end
