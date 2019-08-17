class User < ApplicationRecord
  belongs_to :unit
  has_and_belongs_to_many :groups

  has_secure_token :token

  validates :full_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :queue, -> { where(will_go: true).where.not('id in (select groups_users.user_id from groups_users join groups on groups_users.group_id = groups.id where groups.event_id = ?)', ::Event.order(:created_at).last&.id) }

  def send_confirmation(event)
    regenerate_token
    self.will_go = nil
    save!

    ::UserMailer.confirm(self, event).deliver!
  end

  def accept!
    update!(will_go: true)
  end

  def reject!
    update!(will_go: false)
  end

  def send_notification(group)
    ::UserMailer.notification(self, group).deliver!
  end
end
