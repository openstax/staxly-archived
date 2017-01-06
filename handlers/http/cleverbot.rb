require 'cleverbot'

module Lita
  module Handlers
    module Http
      class Cleverbot
        CLIENT = ::Cleverbot.new(ENV['CLEVERBOT_USER'], ENV['CLEVERBOT_KEY'])

        def run(command, args)
          CLIENT.say "#{command} #{args}"
        end

        HttpRouter.default_command = self
      end
    end
  end
end
