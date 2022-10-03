# frozen_string_literal: true

raise 'The `hashme` library version has changed. Review if this extension still applies' if Hashme::VERSION != '0.2.6'

# Temporary extensions for the `hashme` gem. To be removed when the library supports them.
module Hashme
  # Adds an URI helper class to the Hashme namespace so that properties referencing them
  # typecast to URI objects in Ruby standard library.
  class URI
    def self.new(value)
      URI(value)
    end
  end

  # TrueClass typecasts to a boolean in Hashme. We alias it to `Boolean` for clarity.
  Boolean = TrueClass
end
