# frozen_string_literal: true

RSpec.describe Invopop::Silo::Attachment do
  subject(:attachment) do
    described_class.new(
      'id' => 'e2b7a8b0-b14b-494f-a3c0-d9b1d1e5beeb',
      'created_at' => '2022-09-30T13:27:42.430Z',
      'name' => 'message.pdf',
      'hash' => 'e420fe0b8eabffb530f4aac0a3ac0d4a1245b5d78e0eec4b1d026952bb4be59e',
      'mime' => 'application/pdf',
      'size' => 8119,
      'stored' => true,
      'url' => 'https://silo.invopop.com/6HXS40DCEe2P-AJoVTqybA/4reosLFLSU-jwNmx0eW-6w/message.pdf?h=e420fe0b8eabffb5'
    )
  end

  it 'parses url as a URI object' do
    expect(attachment.url).to be_a(URI::HTTP)
    expect(attachment.url.to_s).to match(/silo\.invopop\.com/)
  end
end
