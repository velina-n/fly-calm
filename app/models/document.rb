# app/models/document.rb
class Document < ApplicationRecord
  has_many :fears_documents
  has_many :fears, through: :fears_documents
  has_many :journeys_documents
  has_many :journeys, through: :journeys_documents
  has_one :questions

  enum kind: [:article, :video, :audio]

  validates :title, :content, presence: true
end
