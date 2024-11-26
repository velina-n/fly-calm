# app/models/journey_fears.rb
class JourneysFear < ApplicationRecord
  belongs_to :journey
  belongs_to :fear
end
