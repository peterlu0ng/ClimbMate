class Attendance < ApplicationRecord
  enum attendance_status: { invited: 0, accepted: 1, maybe: 2, declined: 3 }, _default: :invited

  # Associations
  belongs_to :event
  belongs_to :user

  # Validations
  validates :attendance_status, presence: true
  validates :event_id, presence: true
  validates :user_id, presence: true
end
