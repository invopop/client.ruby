# frozen_string_literal: true

module Invopop
  class Silo
    class Entry
      include Hashme

      property :id, String
      property :created_at, Time
      property :updated_at, Time

      property :env_schema, String
      property :doc_schema, String
      property :digest, String
      property :tags, [String]
      property :meta, GOBL::Org::Meta
      property :draft, Boolean

      property :attachments, [Attachment]
      property :data, GOBL::Envelope
    end
  end
end
