require 'lotus/model'
Dir["#{ __dir__ }/blog/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/blog_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/blog_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/blog_development'
  #    adapter type: :sql, uri: 'mysql://localhost/blog_development'
  #
  adapter type: :sql, uri: ENV['BLOG_DATABASE_URL']

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  mapping "#{__dir__}/config/mapping"
end.load!
