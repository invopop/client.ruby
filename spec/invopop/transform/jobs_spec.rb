# frozen_string_literal: true

RSpec.describe Invopop::Transform::Jobs do
  let(:client) { Invopop::Client.new(access_token: test_token) }

  it 'fetches a specific job' do
    stub_invopop_request :get, '/transform/v1/jobs/123',
                         responding: { id: '123' }

    response = client.transform.jobs('123').fetch
    expect(response.id).to eq('123')
  end

  it 'creates a job' do
    stub_invopop_request :post, '/transform/v1/jobs',
                         with_body: { workflow_id: 234, silo_entry_id: 345 },
                         responding: { id: '123' }

    response = client.transform.jobs.create(workflow_id: 234, silo_entry_id: 345)
    expect(response.id).to eq('123')
  end

  it 'creates a job giving its ID' do
    stub_invopop_request :put, 'transform/v1/jobs/123',
                         with_body: { workflow_id: 234, silo_entry_id: 345 },
                         responding: { id: '123' }

    response = client.transform.jobs(123).create(workflow_id: 234, silo_entry_id: 345)
    expect(response.id).to eq('123')
  end

  it 'creates a job providing a GOBL document' do
    message = GOBL::Note::Message.new(content: 'Hello, world!')
    document = GOBL::Schema::Object.embed(message)

    stub_invopop_request :post, 'transform/v1/jobs',
                         with_body: { workflow_id: 234, data: document.as_json },
                         responding: { id: '123' }

    response = client.transform.jobs.create(workflow_id: 234, data: document)
    expect(response.id).to eq('123')
  end

  it 'creates a job waiting for the response' do
    stub_invopop_request :post, 'transform/v1/jobs',
                         with_query: { wait: true },
                         with_body: { workflow_id: 234, silo_entry_id: 345 },
                         responding: { id: '123' }

    response = client.transform.jobs.create(workflow_id: 234, silo_entry_id: 345, wait: true)
    expect(response.id).to eq('123')
  end
end
