require_relative 'handlers/http_router'
Dir.glob('handlers/http/*.rb') { |file| require_relative file }

Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = 'staxly'

  # The locale code for the language to use.
  # config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  config.robot.admins = JSON.parse(ENV['LITA_ADMINS'] || '[]')

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  config.robot.adapter = :slack
  config.adapters.slack.token = ENV['SLACK_TOKEN'] || ''

  ## Example: Set options for the chosen adapter.
  # config.adapter.username = "myname"
  # config.adapter.password = "secret"

  ## Example: Set options for the Redis connection.
  config.redis[:url] = ENV['REDIS_URL']

  config.http.port = ENV['PORT'] || 80

  ## Example: Set configuration for any loaded handlers. See the handler's
  ## documentation for options.
  config.handlers.http_router.token = ENV['HTTP_TOKEN']
end
