# app/models/document.rb
class Document < ApplicationRecord
  has_many :fears_documents, dependent: :destroy
  has_many :fears, through: :fears_documents
  has_many :journeys_documents, dependent: :destroy
  has_many :journeys, through: :journeys_documents
  has_many :sections, dependent: :destroy
  has_one :question, dependent: :destroy
  has_many :sections, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user
  enum kind: [:article, :video, :audio]
end
