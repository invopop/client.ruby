# frozen_string_literal: true

RSpec.describe Invopop::Transform::Event do
  let(:data) do
    {
      'index' => 1,
      'status' => 'RUN',
      'at' => '2022-10-03T12:18:25.255Z',
      'code' => 'HTTP/201',
      'message' => 'created'
    }
  end

  include_examples 'Shared Struct Examples', :intent

  it 'parses times as Time objects' do
    expect(intent.at).to be_a(Time)
  end
end
