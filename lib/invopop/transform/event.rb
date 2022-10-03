# frozen_string_literal: true

module Invopop
  class Transform
    class Event
      include Hashme

      property :index, Integer
      property :status, String
      property :at, Time
      property :code, String
      property :message, String
    end
  end
end
