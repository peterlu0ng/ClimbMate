class User < ApplicationRecord
  before_save :downcase_email

  # Associations
  has_many :relationships
  has_many :events, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :encrypted_password, presence: true

  private

  def downcase_email
    self.email = email.downcase
  end
end
