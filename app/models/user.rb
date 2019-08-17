class User < ApplicationRecord
  belongs_to :unit
  has_and_belongs_to_many :groups

  has_secure_token :token

  validates :full_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def send_confirmation(event)
    regenerate_token
    self.will_go = nil
    save!

    UserMailer.confirm(self, event).deliver!
  end

  def accept!
    update!(will_go: true)
  end

  def reject!
    update!(will_go: false)
  end
end
