class Relationship < ApplicationRecord
  enum status: { pending: 0, accepted: 1, declined: 2, blocked: 3 }

  # Need to rework these
  belongs_to :user_a, class_name: 'User', foreign_key: 'user_id_a'
  belongs_to :user_b, class_name: 'User', foreign_key: 'user_id_b'

  validates :user_a, presence: true
  validates :user_b, presence: true
  validates :status, presence: true

  validate :not_self_relationship

  private

  def not_self_relationship
    errors.add(:user_b, 'user b cannot be the same as user a') if user_a == user_b
  end
end
