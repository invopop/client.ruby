# frozen_string_literal: true

module Invopop
  # Namespace that groups resources to manage entries in the Invopop silo. The silo is the
  # repository of content entries (documents, envelopes…) of an Invopop account.
  class Silo < Namespace
    def uri_fragment
      '/silo/v1'
    end

    def envelopes(id = nil)
      resource(Envelopes, id)
    end
  end
end
