# frozen_string_literal: true

module Invopop
  # Base class for any error happening when making requests to the Invopop API
  class Error < StandardError; end

  # Raised in the case of a connection error (e.g. network, SSL, timeout)
  class ConnectionError < Error; end

  # Base class for failed HTTP responses from the Invopop API
  class ResponseError < Error
    attr_reader :response

    def initialize(response)
      @response = response
      super message_from_response
    end

    def response_status
      response[:status]
    end

    def response_headers
      response[:headers]
    end

    def response_body
      response[:body]
    end

    private

    def message_from_response
      "The server responded with status #{response_status}: #{response_body}"
    end
  end

  # Raised in the case of a 4xx response
  class ClientError < ResponseError; end

  # Raised in the case of a 5xx response
  class ServerError < ResponseError; end
end
