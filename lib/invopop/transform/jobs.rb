# frozen_string_literal: true

module Invopop
  class Transform
    # Resource that represents jobs in the Invopop account, that is, instances of workflow
    # executions.
    class Jobs < Resource
      def uri_fragment
        '/jobs'
      end

      def build_struct(data)
        Job.new(data)
      end

      def fetch
        super
      end

      def create(workflow_id:, silo_entry_id: nil, data: nil, wait: nil)
        super(
          { workflow_id: workflow_id, silo_entry_id: silo_entry_id, data: data }.compact,
          { wait: wait }.compact
        )
      end
    end
  end
end
