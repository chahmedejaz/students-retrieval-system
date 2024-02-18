class Course < ApplicationRecord
  belongs_to :student

  validates :course_name, presence: true
  validates :credit_hours, numericality: { only_integer: true, greater_than: 0 }
end
