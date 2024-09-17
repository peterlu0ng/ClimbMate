class Event < ApplicationRecord
  enum event_type: { private: 0, public: 1, friends_only: 2, community: 3 }, _default: :private

  # Associations

  belongs_to :gym
  # TODO: Update user id to host id?
  belongs_to :user
  has_many :attendees, through: :attendances, source: :user

  # Validations

  validates :event_type, presence: true

  # Callbacks
end
