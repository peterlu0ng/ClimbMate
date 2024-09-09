class Gym < ApplicationRecord
  # Associations
  has_many :events, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :address, presence: true
end
