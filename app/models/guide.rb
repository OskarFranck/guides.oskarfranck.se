class Guide < ApplicationRecord
  # Relationships
  belongs_to :creator, class_name: 'User'

  # Validations
  validates :title, presence: true
  validates :description, presence: true
end
