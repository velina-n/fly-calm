# app/models/journey.rb
class Journey < ApplicationRecord
  belongs_to :user
  has_many :journeys_fears, dependent: :destroy
  has_many :fears, through: :journeys_fears
  has_many :journeys_documents, dependent: :destroy
  has_many :documents, through: :journeys_documents

  enum status: [:ongoing, :completed]

  validates :status, presence: true
end
