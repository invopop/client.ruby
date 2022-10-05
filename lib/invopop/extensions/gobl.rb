# frozen_string_literal: true

raise 'The `gobl` library version has changed. Review if this extension still applies' if GOBL::VERSION != '0.1.3'

# Temporary extensions for the `gobl` gem. To be removed when the library supports them.
module GOBL
  module Org
    # Extends Meta to allow to be instantiated from a hash. This is necessary for Hashme
    # to instantiate a property of this type.
    class Meta
      def self.new(value)
        if value.is_a?(Hash) && value.keys.map(&:to_s) != %w[_value]
          super _value: value
        else
          super
        end
      end
    end
  end

  # Extends Envelope to allow to be instantiated from a hash. This is necessary for Hashme
  # to instantiate a property of this type.
  class Envelope
    def self.new(attrs)
      if attrs.key?('$schema')
        from_gobl! attrs
      else
        super
      end
    end
  end
end
