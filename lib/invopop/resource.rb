# frozen_string_literal: true

module Invopop
  # Base class for resources. A resource is an entity of the Invopop API model identified
  # by an URI over which actions can be performed.
  class Resource
    def initialize(conn, parent_fragment)
      self.conn = conn
      self.parent_fragment = parent_fragment
    end

    private

    attr_accessor :conn, :parent_fragment

    def fetch(*params)
      conn.get(path, *params)
    end

    def path
      @path ||= [parent_fragment, uri_fragment].join
    end

    def uri_fragment
      raise NotImplementedError, 'Subclasses are expected to implement this method'
    end
  end
end
