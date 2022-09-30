# frozen_string_literal: true

RSpec.describe Invopop::Utils::UUID do
  let(:client) { Invopop::Client.new(access_token: test_token) }

  it 'fetches an UUID' do
    stub_invopop_request :get, '/utils/v1/uuid',
                         responding: { 'uuid' => '123', 'version' => '4' }

    response = client.utils.uuid.fetch
    expect(response).to eq('uuid' => '123', 'version' => '4')
  end

  it 'fetches an UUID in a specific version' do
    stub_invopop_request :get, '/utils/v1/uuid',
                         with_query: { v: '1' },
                         responding: { 'uuid' => '123', 'version' => '1' }

    response = client.utils.uuid.fetch(v: 1)
    expect(response).to eq('uuid' => '123', 'version' => '1')
  end
end
