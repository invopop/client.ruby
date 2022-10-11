# frozen_string_literal: true

module Invopop
  class Utils
    # Resource that represent random UUIDs.
    class UUID < Resource
      def uri_fragment
        '/uuid'
      end

      def fetch(version: nil)
        super({ v: version }.compact)
      end
    end
  end
end
