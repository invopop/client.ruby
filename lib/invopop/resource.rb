# frozen_string_literal: true

module Invopop
  # Base class for resources. A resource is an entity of the Invopop API model identified
  # by an URI over which actions can be performed.
  class Resource
    def initialize(conn, parent_fragment, id)
      self.conn = conn
      self.parent_fragment = parent_fragment
      self.id = id
    end

    private

    attr_accessor :conn, :parent_fragment, :id

    def fetch(*params)
      conn.get(path, *params)
    end

    def create(body)
      if single_resource?
        conn.put(path, body)
      else
        conn.post(path, body)
      end
    end

    def update(body)
      conn.patch(path, body)
    end

    def path
      @path ||= [parent_fragment, uri_fragment, id_fragment].join
    end

    def uri_fragment
      raise NotImplementedError, 'Subclasses are expected to implement this method'
    end

    def id_fragment
      "/#{id}" if single_resource?
    end

    def single_resource?
      !!id
    end
  end
end
