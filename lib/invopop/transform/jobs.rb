# frozen_string_literal: true

module Invopop
  class Transform
    # Resource that represents jobs in the Invopop account, that is, instances of workflow
    # executions.
    class Jobs < Resource
      public :fetch, :create

      def uri_fragment
        '/jobs'
      end
    end
  end
end
