# frozen_string_literal: true

RSpec.describe Invopop::Silo::Entries do
  let(:client) { Invopop::Client.new(access_token: test_token) }

  it 'fetches all envelopes' do
    stub_invopop_request :get, '/silo/v1/entries',
                         responding: { list: [{ id: '123' }, { id: '234' }] }

    response = client.silo.entries.fetch
    expect(response.list.size).to eq(2)
    expect(response.list.first.id).to eq('123')
  end

  it 'fetches a specific envelope' do
    stub_invopop_request :get, '/silo/v1/entries/123',
                         responding: { id: '123' }

    envelope = client.silo.entries('123').fetch
    expect(envelope.id).to eq('123')
  end

  it 'creates an envelope' do
    stub_invopop_request :post, '/silo/v1/entries',
                         with_body: { data: { key: 'value' } },
                         responding: { id: '123' }

    response = client.silo.entries.create(data: { key: 'value' })
    expect(response.id).to eq('123')
  end

  it 'creates an envelope from a GOBL document' do
    message = GOBL::Note::Message.new(content: 'Hello, world!')
    document = GOBL::Document.embed(message)

    stub_invopop_request :post, '/silo/v1/entries',
                         with_body: { data: document.as_json },
                         responding: { id: '123' }

    response = client.silo.entries.create(data: document)
    expect(response.id).to eq('123')
  end

  it 'creates an envelope giving its ID' do
    stub_invopop_request :put, 'silo/v1/entries/123',
                         with_body: { data: { key: 'value' } },
                         responding: { id: '123' }

    response = client.silo.entries('123').create(data: { key: 'value' })
    expect(response.id).to eq('123')
  end

  it 'updates an envelope' do
    stub_invopop_request :patch, '/silo/v1/entries/123',
                         with_body: { data: { key: 'value' } },
                         responding: { id: '123' }

    response = client.silo.entries('123').update(data: { key: 'value' })
    expect(response.id).to eq('123')
  end
end
