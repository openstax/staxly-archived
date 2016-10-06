module Lita
  module Handlers
    module Http
      class Blame
        def run(command, args)
          "It's all #{args}'s fault!"
        end

        HttpRouter.register self
      end
    end
  end
end
