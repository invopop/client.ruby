# frozen_string_literal: true

module Invopop
  # Base class for namespaces. A namespace groups and provides access to a set of related
  # API resources.
  class Namespace
    def initialize(conn)
      self.conn = conn
    end

    private

    attr_accessor :conn

    def resource(klass, id = nil)
      resources[[klass, id]] = klass.new(conn, uri_fragment, id)
    end

    def resources
      @resources ||= {}
    end

    def uri_fragment
      raise NotImplementedError, 'Subclasses are expected to implement this method'
    end
  end
end
