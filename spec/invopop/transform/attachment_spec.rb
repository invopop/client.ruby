# frozen_string_literal: true

RSpec.describe Invopop::Transform::Attachment do
  let(:data) do
    {
      'id' => '4cda8cda-5f87-45e1-9299-32556bfb1b88',
      'name' => 'message.pdf',
      'desc' => 'A generated pdf file',
      'hash' => '3f9fa1aef7fe3b3e7c431baacf79dd94aa60c4288ea52b78b508fe47ccb882f0',
      'mime' => 'application/pdf',
      'size' => 8118,
      'url' => 'https://silo.invopop.com/mNzZ90MTEe2P-AJoVTqybA/TNqM2l-HReGSmTJVa_sbiA/message.pdf?h=3f9fa1aef7fe3b3e',
      'meta' => { 'pdf-gen-version' => '0.1.2' }
    }
  end

  include_examples 'Shared Struct Examples', :attachment

  it 'parses url as a URI object' do
    expect(attachment.url).to be_a(URI::HTTP)
    expect(attachment.url.to_s).to eq(data['url'])
  end

  it 'parses meta as a hash' do
    expect(attachment.meta['pdf-gen-version']).to eq('0.1.2')
  end
end
