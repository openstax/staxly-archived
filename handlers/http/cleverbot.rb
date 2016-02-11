require 'cleverbot'

module Lita
  module Handlers
    module Http
      class Cleverbot
        CLIENT = ::Cleverbot::Client.new

        def run(args)
          CLIENT.write args
        end

        HttpRouter.default_command = self
      end
    end
  end
end
