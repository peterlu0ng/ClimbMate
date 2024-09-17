class Event < ApplicationRecord
  enum event_type: { private: 0, public: 1, friends_only: 2, community: 3 }, _default: :private

  # Associations
  belongs_to :gym
  belongs_to :user
  has_many :attendees, through: :attendances, source: :user

  # Validations
  validates :name, presence: true
  validates :event_type, presence: true
  validates :open_time, presence: true
  validates :close_time, presence: true
  validates :valid_time_range

  def duration
    (close_time - open_time).to_i / 60 # Returns duration in minutes
  end

  def active?
    Time.current.between?(open_time, close_time)
  end

  private

  # Custom validation to ensure open_time is before close_time
  def valid_time_range
    errors.add(:close_time, 'must be after the open time') if open_time >= close_time
  end
end
