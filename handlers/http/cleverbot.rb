require 'cleverbot'

module Lita
  module Handlers
    module Http
      class Cleverbot
        CLIENT = ::Cleverbot::Client.new

        def run(command, args)
          CLIENT.write "#{command} #{args}"
        end

        HttpRouter.default_command = self
      end
    end
  end
end
