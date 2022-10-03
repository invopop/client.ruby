# frozen_string_literal: true

module Invopop
  class Utils
    # Resource representing a ping to the Invopop API. To use for testing connectivity.
    class Ping < Resource
      public :fetch

      def uri_fragment
        '/ping'
      end
    end
  end
end
