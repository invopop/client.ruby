# frozen_string_literal: true

module Invopop
  class Silo
    # Resource that represent envelopes in the silo, that is, content entries in the
    # Invopop account.
    class Envelopes < Resource
      def uri_fragment
        '/envelopes'
      end

      def fetch
        super
      end

      def create(data:)
        super
      end

      def update(data:)
        super
      end

      def build_struct(data)
        Envelope.new(data)
      end

      def build_collection(data)
        EnvelopeCollection.new(data)
      end
    end
  end
end
