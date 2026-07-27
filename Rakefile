require_relative "config/environment"
require "rake"
require "fileutils"

MIGRATIONS_PATH = File.expand_path("db/migrate", __dir__)

desc "Open a Pry console"
task :console do
  Pry.start
end

namespace :db do
  desc "Create the configured database"
  task :create do
    database_path = ActiveRecord::Base.connection_db_config.database

    FileUtils.mkdir_p(File.dirname(database_path))
    ActiveRecord::Base.connection

    puts "Created database '#{database_path}'"
  end

  desc "Run all pending migrations"
  task :migrate do
    ActiveRecord::MigrationContext
      .new(MIGRATIONS_PATH)
      .migrate
  end

  desc "Display migration status"
  task :status do
    context = ActiveRecord::MigrationContext.new(MIGRATIONS_PATH)
    applied_versions = context.get_all_versions

    puts
    puts " Status   Migration ID    Migration Name"
    puts "--------------------------------------------------"

    context.migrations.each do |migration|
      status = applied_versions.include?(migration.version) ? "up" : "down"

      puts format(
        "   %-5s  %-14s  %s",
        status,
        migration.version,
        migration.name
      )
    end
  end

  desc "Load seed data"
  task :seed do
    load File.expand_path("db/seeds.rb", __dir__)
  end

  desc "Create a timestamped migration with NAME=..."
  task :create_migration do
    name = ENV["NAME"]

    if name.nil? || name.strip.empty?
      abort 'Provide a migration name: rake db:create_migration NAME=create_artists'
    end

    FileUtils.mkdir_p(MIGRATIONS_PATH)

    timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")
    filename = "#{timestamp}_#{name}.rb"
    filepath = File.join(MIGRATIONS_PATH, filename)
    class_name = name.split("_").map(&:capitalize).join
    migration_version = ActiveRecord::Migration.current_version

    File.write(
      filepath,
      <<~RUBY
        class #{class_name} < ActiveRecord::Migration[#{migration_version}]
          def change
          end
        end
      RUBY
    )

    puts filepath
  end
end