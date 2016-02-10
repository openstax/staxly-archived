module Lita
  module Handlers
    module Http
      class Cleverbot
        API = ::CleverBot.new

        def run(args)
          API.think args
        end

        HttpRouter.default_command = self
      end
    end
  end
end
