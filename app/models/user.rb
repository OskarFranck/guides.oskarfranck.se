class User < ApplicationRecord
  # Relationships
  #belongs_to :current_plan, class_name: 'SubscriptionPlan', optional: true
  #has_many :user_creator_assignments
  #has_many :assigned_creators, through: :user_creator_assignments, source: :creator
  has_many :guides, foreign_key: :creator_id
  #has_many :payments

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  # Secure Passwords
  has_secure_password # Requires bcrypt gem
end
