# frozen_string_literal: true

module Invopop
  #  Thin wrapper around the underlying HTTP client library (Faraday) to abstract the rest
  #  of the gem from it.
  class Connection
    def initialize(access_token)
      self.access_token = access_token
    end

    def get(path, params = {})
      faraday.get(path, params).body
    end

    def post(path, body, params = {})
      faraday.post(path, body) do |req|
        req.params = params
      end.body
    end

    def put(path, body, params = {})
      faraday.put(path, body) do |req|
        req.params = params
      end.body
    end

    def patch(path, body, params = {})
      faraday.patch(path, body) do |req|
        req.params = params
      end.body
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
        f.use Invopop::Connection::ErrorManager
      end
    end
  end
end
