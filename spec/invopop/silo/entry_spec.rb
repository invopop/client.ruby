# frozen_string_literal: true

RSpec.describe Invopop::Silo::Entry do
  let(:data) do
    {
      'id' => 'e875d2e3-40c2-11ed-8ff8-0268553ab26c',
      'created_at' => '2022-09-30T13:22:18.642Z',
      'updated_at' => '2022-09-30T13:27:42.966Z',
      'env_schema' => 'https://gobl.org/draft-0/envelope',
      'doc_schema' => 'https://gobl.org/draft-0/note/message',
      'digest' => { 'alg' => 'sha256', 'val' => '34321e7ef2f62a6a9597791a10105187d197b9ee3607b53b4a50131349ae902e' },
      'draft' => true,
      'meta' => { 'key' => 'value' },
      'attachments' => [
        {
          'id' => 'e2b7a8b0-b14b-494f-a3c0-d9b1d1e5beeb',
          'created_at' => '2022-09-30T13:27:42.430Z',
          'name' => 'message.pdf',
          'hash' => 'e420fe0b8eabffb530f4aac0a3ac0d4a1245b5d78e0eec4b1d026952bb4be59e',
          'mime' => 'application/pdf',
          'size' => 8119,
          'stored' => true,
          'url' => 'https://silo.invopop.com/6HXS40DCEe2P-AJoVTqybA/4reosLFLSU-jwNmx0eW-6w/message.pdf?h=e420fe0b8eabffb5'
        }
      ],
      'data' => {
        '$schema' => 'https://gobl.org/draft-0/envelope',
        'head' => {
          'uuid' => 'e875d2e3-40c2-11ed-8ff8-0268553ab26c',
          'dig' => { 'alg' => 'sha256', 'val' => '34321e7ef2f62a6a9597791a10105187d197b9ee3607b53b4a50131349ae902e' },
          'draft' => true
        },
        'doc' => {
          '$schema' => 'https://gobl.org/draft-0/note/message',
          'content' => 'Hello world!'
        }
      }
    }
  end

  include_examples 'Shared Struct Examples', :envelope

  it 'parses times as Time objects' do
    expect(envelope.created_at).to be_a(Time)
    expect(envelope.updated_at).to be_a(Time)
  end

  it 'parses `meta` as a GOBL::Meta object' do
    expect(envelope.meta).to be_a(GOBL::Org::Meta)
    expect(envelope.meta['key']).to eq('value')
  end

  it 'parses `draft` as a boolean' do
    expect(envelope.draft).to be(true)
  end

  it 'parses `data` as a GOBL::Envelope' do
    expect(envelope.data).to be_a(GOBL::Envelope)
    expect(envelope.data.extract.content).to eq('Hello world!')
  end

  it 'parses `attachments` as an array of Attachment objects' do
    expect(envelope.attachments.size).to be(1)
    expect(envelope.attachments.first).to be_a(Invopop::Silo::Attachment)
    expect(envelope.attachments.first.name).to eq('message.pdf')
  end
end
