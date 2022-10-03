# frozen_string_literal: true

RSpec.describe Invopop::Transform::Intent do
  let(:data) do
    {
      'id' => '5a32f1a0-cf2b-4def-8a01-38aaaec0531e',
      'created_at' => '2022-10-03T12:18:25.152Z',
      'updated_at' => '2022-10-03T12:18:25.396Z',
      'integration_id' => '284f8097-ae5d-440b-a966-8dc700323fef',
      'events' => [
        {
          'index' => 1,
          'status' => 'RUN',
          'at' => '2022-10-03T12:18:25.255Z'
        }
      ],
      'completed' => true
    }
  end

  include_examples 'Shared Struct Examples', :intent

  it 'parses times as Time objects' do
    expect(intent.created_at).to be_a(Time)
    expect(intent.updated_at).to be_a(Time)
  end

  it 'parses `events` as an Array of Event objects' do
    expect(intent.events.size).to be(1)
    expect(intent.events.first).to be_a(Invopop::Transform::Event)
    expect(intent.events.first.status).to eq('RUN')
  end

  it 'parses `completed` as a boolean' do
    expect(intent.completed).to be(true)
  end
end
