# frozen_string_literal: true

module Invopop
  class Silo
    # Resource that represent envelopes in the silo, that is, content entries in the
    # Invopop account.
    class Envelopes < Resource
      public :fetch, :create, :update

      def uri_fragment
        '/envelopes'
      end

      def fetch(*args)
        if single_resource?
          Envelope.new(super)
        else
          EnvelopeCollection.new(super)
        end
      end

      def create(*args)
        Envelope.new(super)
      end

      def update(*args)
        Envelope.new(super)
      end
    end
  end
end
