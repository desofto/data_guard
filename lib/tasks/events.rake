namespace :event do
  desc 'Create a new event'
  task create: :environment do
    if Event.order(:created_at).last.created_at >= Time.zone.today.beginning_of_day
      puts 'Already created'
    else
      ::Event.create!
    end
  end

  desc 'Create a new event without validation'
  task create!: :environment do
    ::Event.create!
  end
end
