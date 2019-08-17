class Event < ApplicationRecord
  has_many :groups, dependent: :destroy

  after_create :send_requests

  private

  def send_requests
    User.all.find_each do |user|
      user.send_confirmation(self)
    end
  end
end
