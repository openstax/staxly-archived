module Lita
  module Handlers
    module Http
      class Cleverbot
        API = ::CleverBot.new

        def run(args)
          resp = API.think args
          puts resp
          resp
        end

        HttpRouter.default_command = self
      end
    end
  end
end
