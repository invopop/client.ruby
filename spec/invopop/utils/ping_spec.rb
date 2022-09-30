# frozen_string_literal: true

RSpec.describe Invopop::Utils::Ping do
  let(:client) { Invopop::Client.new(access_token: test_token) }

  it 'fetches a ping' do
    stub_invopop_request :get, '/utils/v1/ping',
                         responding: { 'ping' => 'pong' }

    response = client.utils.ping.fetch
    expect(response).to eq('ping' => 'pong')
  end
end
