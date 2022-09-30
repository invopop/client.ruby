# frozen_string_literal: true

require 'webmock/rspec'

RSpec.shared_context 'with stub helpers' do
  def stub_invopop_request(method, path, responding: nil, with_body: nil, with_query: nil)
    stub_request(method, URI.join('https://api.invopop.com', path))
      .with(
        headers: { authorization: "Bearer #{test_token}" },
        query: with_query,
        body: with_body&.to_json
      )
      .to_return(
        body: responding.to_json,
        headers: { content_type: 'application/json' }
      )
  end
end

RSpec.configure do |config|
  config.include_context 'with stub helpers'
end
