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
    end
  end
end