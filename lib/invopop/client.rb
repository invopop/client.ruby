# frozen_string_literal: true

module Invopop
  # Client for the Invopop API.
  class Client
    def initialize(access_token:)
      self.conn = Connection.new(access_token)
    end

    def utils
      @utils ||= Utils.new(conn)
    end

    private

    attr_accessor :conn
  end
end
