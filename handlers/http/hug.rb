module Lita
  module Handlers
    module Http
      class Hug
        def run(command, args)
          "༼ つ ◕_◕ ༽つ #{args}"
        end

        HttpRouter.register self
      end
    end
  end
end
