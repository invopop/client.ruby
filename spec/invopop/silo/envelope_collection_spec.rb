# frozen_string_literal: true

RSpec.describe Invopop::Silo::EnvelopeCollection do
  let(:data) do
    {
      'list' => [
        {
          'id' => '9a4f46e9-40c8-11ed-8ff8-0268553ab26c',
          'created_at' => '2022-09-30T14:03:04.504Z',
          'updated_at' => '2022-09-30T14:03:04.504Z',
          'env_schema' => 'https://gobl.org/draft-0/envelope',
          'doc_schema' => 'https://gobl.org/draft-0/note/message',
          'digest' => {
            'alg' => 'sha256',
            'val' => '6fbf3f9e2be925ba4eb79dbf71c09305c6031125004d1482204b64a4918c8ae3'
          },
          'draft' => true,
          'data' => nil
        }
      ],
      'limit' => 1,
      'created_at' => '2022-09-30T14:03:04.504Z',
      'next_created_at' => '2022-09-28T04:39:58.348Z'
    }
  end

  include_examples 'Shared Struct Examples', :collection

  it 'parses `list` as an array of Envelope objects' do
    expect(collection.list.size).to eq(1)
    expect(collection.list.first).to be_a(Invopop::Silo::Envelope)
    expect(collection.list.first.id).to eq('9a4f46e9-40c8-11ed-8ff8-0268553ab26c')
  end
end
