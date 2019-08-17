namespace :groups do
  desc 'Generate groups'
  task :generate, [:count] => :environment do |_, args|
    count = args[:count] || ENV['count']
    ::GroupsGenerator.run(count)
  end
end
