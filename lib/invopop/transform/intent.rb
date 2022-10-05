# frozen_string_literal: true

module Invopop
  class Transform
    class Intent
      include Hashme

      property :id, String
      property :created_at, Time
      property :updated_at, Time

      property :integration_id, String

      property :events, [Event]

      property :completed, Boolean
    end
  end
end
