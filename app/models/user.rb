class User < ApplicationRecord
  belongs_to :unit
  has_and_belongs_to_many :groups

  has_secure_token :token

  validates :full_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
