namespace :event do
  desc 'Create a new event'
  task create: :environment do
    last_event = ::User.queue.order(:unit_id).first
    if last_event.present? && last_event.created_at >= Time.zone.today.beginning_of_day
      puts 'Already created'
    else
      ::Event.create!
    end
  end

  desc 'Create a new event without validation'
  task create!: :environment do
    ::Event.create!
  end

  desc 'Show stats'
  task stats: :environment do
    puts "By now we have #{::User.where.not(will_go: nil).count} respose(s) from total of #{::User.count}"
  end
end
