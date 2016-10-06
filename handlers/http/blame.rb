module Lita
  module Handlers
    module Http
      class Hug
        def run(command, args)
          "It's all #{args}'s fault!'"
        end

        HttpRouter.register_command(name, self)
      end
    end
  end
end
