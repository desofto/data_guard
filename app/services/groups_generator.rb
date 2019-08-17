class GroupsGenerator
  class << self
    def run(count)
      new(count).run
    end
  end

  def initialize(count = 3)
    @count = count
  end

  def run
    ActiveRecord::Base.transaction do
      event = ::Event.order(:created_at).last

      groups = @count.times.map { ::Group.create(event: event) }

      while ::User.queue.any? do
        groups.map(&:take_user)
      end

      groups.map(&:appoint_leader!)
    end
  end
end
