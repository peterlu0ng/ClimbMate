class Gym < ApplicationRecord
  # Associations
  has_many :events, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :address, presence: true

  # JSONB for handling operating_hours
  store_accessor :operating_hours, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday
end
