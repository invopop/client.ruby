# frozen_string_literal: true

module Invopop
  class Silo
    # Resource that represent envelopes in the silo, that is, content entries in the
    # Invopop account.
    class Entries < Resource
      def uri_fragment
        '/entries'
      end

      def fetch
        super
      end

      def create(data: nil, previous_id: nil, correct: nil)
        super({ data: data, previous_id: previous_id, correct: correct }.compact)
      end

      def update(data:)
        super
      end

      def build_struct(data)
        Entry.new(data)
      end

      def build_collection(data)
        EntryCollection.new(data)
      end
    end
  end
end
