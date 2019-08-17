class Event < ApplicationRecord
  has_many :groups, dependent: :destroy

  after_create :send_requests

  private

  def send_requests
    User.all.find_each do |user|
      UserMailer.confirm(user, self).deliver!
    end
  end
end
