module Lita
  module Handlers
    module Http
      class Hug
        def run(args)
          "༼ つ ◕_◕ ༽つ #{args}"
        end

        HttpRouter.register_command(:hug, self)
      end
    end
  end
end