class Group < ApplicationRecord
  belongs_to :event
  belongs_to :leader, class_name: 'User', optional: true

  has_and_belongs_to_many :users

  def appoint_leader!
    leader_id = users.joins('left join groups on groups.leader_id = users.id').order(Arel.sql("coalesce(groups.created_at, '2000-01-01')")).first(users.count).pluck(:id).first
    self.leader = User.find(leader_id)
    save!

    ::LeaderMailer.notification(leader, self).deliver!
  end

  def select_restaurant(restaurant)
    self.restaurant = restaurant
    save!

    notify_users
  end

  def take_user
    user = ::User.queue.order(:unit_id).first
    return unless user.present?

    users << user
  end

  private

  def notify_users
    users.each do |user|
      next if user == leader
      user.send_notification(self)
    end
  end
end
