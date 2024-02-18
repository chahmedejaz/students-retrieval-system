class Student < ApplicationRecord
  has_one :course, dependent: :destroy

  validates :name, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP
end
