require_relative 'database'
require_relative 'import'

task :default do
end

namespace :database do
  desc 'Create tables to import data'
  task :migrate do
    Database.new.migrate
  end

  desc 'Create team table'
  task :team do
    Database.new.team
  end

  desc 'Create match table'
  task :match do
    Database.new.match
  end

  desc 'Create indexes on table'
  task :indexes do
    Database.new.indexes
  end
end

namespace :import do
  desc 'Import all data into tables'
  task :all do
    Import.new.teams
    Import.new.matches
  end

  desc 'Import teams into table'
  task :teams do
    Import.new.teams
  end

  desc 'Import matches into table'
  task :matches do
    Import.new.matches
  end
end
