# frozen_string_literal: true

RSpec.describe Invopop::Error do
  let(:client) { Invopop::Client.new(access_token: test_token) }

  it 'is raised when there are client errors' do
    stub_invopop_request(:get, '/utils/v1/ping').to_return(status: 402)

    expect { client.utils.ping.fetch }.to raise_error Invopop::ClientError, /402/
  end

  it 'is raised when there are server errors' do
    stub_invopop_request(:get, '/utils/v1/ping').to_return(status: 500)

    expect { client.utils.ping.fetch }.to raise_error Invopop::ServerError, /500/
  end

  it 'is raised when there are connection errors' do
    stub_invopop_request(:get, '/utils/v1/ping').to_timeout

    expect { client.utils.ping.fetch }.to raise_error Invopop::ConnectionError
  end

  it 'is raised when there are other Faraday errors' do
    stub_invopop_request(:get, '/utils/v1/ping').to_raise Faraday::Error

    expect { client.utils.ping.fetch }.to raise_error described_class
  end
end
