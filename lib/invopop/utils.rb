# frozen_string_literal: true

module Invopop
  # Namespace that groups various utility resources
  class Utils < Namespace
    def uri_fragment
      '/utils/v1'
    end

    def ping
      resource(Ping)
    end

    def uuid
      resource(UUID)
    end
  end
end
