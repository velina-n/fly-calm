# app/models/fears_document.rb
class FearsDocument < ApplicationRecord
  belongs_to :fear
  belongs_to :document
end
