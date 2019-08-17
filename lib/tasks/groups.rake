namespace :groups do
  desc 'Generate groups'
  task :generate, [:count] => :environment do |_, args|
    count = args[:count] || ENV['count'] || 3
    ::GroupsGenerator.run(count.to_i)
  end
end
