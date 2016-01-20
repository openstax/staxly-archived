module Lita
  module Handlers
    class Hug < Handler
      def hug(response)
        response.reply "༼ つ ◕_◕ ༽つ #{response.match_data[1]}"
      end

      route(/\Ahug\s+(.+)\z/, :hug, command: true, help: {
        "hug SOMEONE" => "Causes Staxly to hug SOMEONE."
      })

      Lita.register_handler(self)
    end
  end
end
