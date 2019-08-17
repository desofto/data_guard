class User < ApplicationRecord
  belongs_to :unit

  validates :full_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
