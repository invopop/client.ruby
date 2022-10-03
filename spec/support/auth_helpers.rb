# frozen_string_literal: true

RSpec.shared_context 'with authentication helpers' do
  let(:test_token) { 'token-123' }
end

RSpec.configure do |config|
  config.include_context 'with authentication helpers'
end
