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

    def fetch(params = {})
      data = conn.get(path, params)

      if single_resource?
        build_struct(data)
      else
        build_collection(data)
      end
    end

    def create(body, params = {})
      data = if single_resource?
               conn.put(path, body, params)
             else
               conn.post(path, body, params)
             end

      build_struct(data)
    end

    def update(body, params = {})
      data = conn.patch(path, body, params)

      build_struct(data)
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

    # By default return the raw data. To be overriden in subclasses to wrap it in a single
    # struct type
    def build_struct(data)
      data
    end

    # By default return the raw data. To be overriden in subclasses to wrap it in a struct
    # collection type
    def build_collection(data)
      data
    end
  end
end
