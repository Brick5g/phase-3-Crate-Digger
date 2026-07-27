ENV["RACK_ENV"] ||= "development"

require "bundler/setup"
Bundler.require(:default, ENV["RACK_ENV"])

require "active_record"
require "yaml"
require "require_all"

require_all File.expand_path("../app/models", __dir__)

database_config = YAML.load_file(
  File.expand_path("database.yml", __dir__)
)

ActiveRecord::Base.establish_connection(
  database_config[ENV["RACK_ENV"]]
)