# frozen_string_literal: true

module Invopop
  class Silo
    class EnvelopeCollection
      include Hashme

      property :list, [Envelope]
      property :limit, Integer
      property :created_at, String
      property :next_created_at, String
    end
  end
end
