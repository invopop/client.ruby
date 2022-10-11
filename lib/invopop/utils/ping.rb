# frozen_string_literal: true

module Invopop
  class Utils
    # Resource representing a ping to the Invopop API. To use for testing connectivity.
    class Ping < Resource
      def uri_fragment
        '/ping'
      end

      def fetch
        super
      end
    end
  end
end
