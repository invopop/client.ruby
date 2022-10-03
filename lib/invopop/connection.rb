# frozen_string_literal: true

module Invopop
  #  Thin wrapper around the underlying HTTP client library (Faraday) to abstract the rest
  #  of the gem from it.
  class Connection
    def initialize(access_token)
      self.access_token = access_token
    end

    def get(path, *params)
      faraday.get(path, *params).body
    end

    def post(path, body)
      faraday.post(path, body).body
    end

    def put(path, body)
      faraday.put(path, body).body
    end

    def patch(path, body)
      faraday.patch(path, body).body
    end

    private

    attr_accessor :access_token

    def faraday
      @faraday ||= build_faraday
    end

    def build_faraday
      options = {
        url: 'https://api.invopop.com/',
        headers: {
          authorization: "Bearer #{access_token}"
        }
      }

      Faraday.new(options) do |f|
        f.response :json
        f.request :json
      end
    end
  end
end
