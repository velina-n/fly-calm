class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :document

  validates :user_id, uniqueness: { scope: :document_id } # Un favori unique par utilisateur et document
end
