# frozen_string_literal: true

module Invopop
  class Connection
    # Faraday Middleware responsible for raising `Invopop::Error`s
    class ErrorManager < Faraday::Middleware
      def call(env)
        super
      rescue Faraday::ConnectionFailed, Faraday::SSLError, Faraday::TimeoutError => e
        raise Invopop::ConnectionError, e
      rescue Faraday::Error
        raise Invopop::Error, e
      end

      def on_complete(env)
        case env[:status]
        when 400..499
          raise Invopop::ClientError, env
        when 500..599
          raise Invopop::ServerError, env
        end
      end
    end
  end
end
