# frozen_string_literal: true

module Invopop
  # Namespace that groups resources to manage entries in the Invopop silo. The silo is the
  # repository of content entries (documents, envelopes…) of an Invopop account.
  class Silo < Namespace
    def uri_fragment
      '/silo/v1'
    end

    def entries(id = nil)
      resource(Entries, id)
    end
  end
end
