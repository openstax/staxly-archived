module Lita
  module Handlers
    class HttpRouter < Handler
      config :token

      class << self
        attr_accessor :default_command

        def register(klass)
          command = klass.name.split('::').last.downcase
          commands[command] = klass
        end

        def commands
          @@commands ||= {}
        end
      end

      def run(command, args)
        klass = self.class.commands[command.to_s.downcase] || self.class.default_command
        return if klass.nil?
        klass.new.run(command, args)
      end

      def json_response(object)
        case object
        when String
          { text: object }.to_json
        else
          object.to_json
        end
      end

      http.post "/" do |request, response|
        name, command, args = request[:text].to_s.split(' ', 3)
        next if name.nil? ||
                !name.include?(Lita.config.robot.name) ||
                request[:token] != config.token
        response.headers["Content-Type"] = "application/json"
        response.body << json_response(run(command, args))
      end

      Lita.register_handler(self)
    end
  end
end
