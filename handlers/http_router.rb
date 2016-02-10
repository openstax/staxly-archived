module Lita
  module Handlers
    class HttpRouter < Handler
      cattr_accessor :default_command

      config :token

      def self.register_command(command, klass)
        commands[command.to_s] = klass
      end

      def self.commands
        @@commands ||= {}
      end

      def run(command, args)
        klass = self.class.commands[command.to_s] || self.class.default_command
        return if klass.nil?
        klass.new.run(args)
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
        next unless name.include?(Lita.config.robot.name) && request[:token] == config.token
        response.headers["Content-Type"] = "application/json"
        response.body << json_response(run(command, args))
      end

      Lita.register_handler(self)
    end
  end
end
