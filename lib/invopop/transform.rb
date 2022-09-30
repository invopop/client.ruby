# frozen_string_literal: true

module Invopop
  # Namespace that groups resources related to document transformation
  class Transform < Namespace
    def uri_fragment
      '/transform/v1'
    end

    def jobs(id = nil)
      resource(Jobs, id)
    end
  end
end
