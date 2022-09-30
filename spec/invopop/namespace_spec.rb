# frozen_string_literal: true

RSpec.describe Invopop::Namespace do
  let(:test_namespace) do
    Class.new(Invopop::Namespace) do
      def uri_fragment
        '/test'
      end

      def list_resource
        resource Invopop::Resource
      end

      def single_resource
        resource Invopop::Resource, 123
      end
    end
  end

  it 'doesn’t cache different resources with the same key' do
    namespace = test_namespace.new(nil)
    expect(namespace.list_resource).not_to eq(namespace.single_resource)
  end
end
