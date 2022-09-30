# frozen_string_literal: true

module Invopop
  class Utils
    # Resource that represent random UUIDs.
    class UUID < Resource
      public :fetch

      def uri_fragment
        '/uuid'
      end
    end
  end
end
