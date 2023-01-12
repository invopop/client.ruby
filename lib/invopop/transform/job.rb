# frozen_string_literal: true

module Invopop
  class Transform
    class Job
      include Hashme

      property :id, String
      property :created_at, Time
      property :updated_at, Time

      property :silo_entry_id, String
      property :workflow_id, String

      property :tags, [String]

      property :status, String
      property :completed_at, Time

      property :intents, [Intent]

      property :envelope, GOBL::Envelope
      property :attachments, [Attachment]
    end
  end
end
