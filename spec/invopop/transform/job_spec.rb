# frozen_string_literal: true

RSpec.describe Invopop::Transform::Job do
  let(:data) do
    {
      'id' => '98dcd9f7-4313-11ed-8ff8-0268553ab26c',
      'created_at' => '2022-10-03T12:04:56.802Z',
      'updated_at' => '2022-10-03T12:04:58.015Z',
      'silo_entry_id' => '98dcd9f7-4313-11ed-8ff8-0268553ab26c',
      'workflow_id' => '97de927f-07ab-4926-ae5f-04c05b4978a7',
      'tags' => %w[test message],
      'status' => 'OK',
      'completed_at' => '2022-10-03T12:04:58.015Z',
      'intents' => [
        {
          'id' => '4cda8cda-5f87-45e1-9299-32556bfb1b88',
          'created_at' => '2022-10-03T12:04:57.330Z',
          'updated_at' => '2022-10-03T12:04:57.979Z',
          'integration_id' => 'fad728a0-fb07-48b8-97dc-99ae27bb47a2',
          'events' => [
            {
              'index' => 1,
              'status' => 'RUN',
              'at' => '2022-10-03T12:04:57.432Z'
            },
            {
              'index' => 2,
              'status' => 'OK',
              'at' => '2022-10-03T12:04:57.979Z'
            }
          ],
          'completed' => true
        }
      ],
      'envelope' => {
        '$schema' => 'https://gobl.org/draft-0/envelope',
        'head' => {
          'uuid' => '98dcd9f7-4313-11ed-8ff8-0268553ab26c',
          'dig' => {
            'alg' => 'sha256',
            'val' => '34321e7ef2f62a6a9597791a10105187d197b9ee3607b53b4a50131349ae902e'
          },
          'draft' => true
        },
        'doc' => {
          '$schema' => 'https://gobl.org/draft-0/note/message',
          'content' => 'Hello world!'
        }
      },
      'attachments' => [
        {
          'id' => '4cda8cda-5f87-45e1-9299-32556bfb1b88',
          'name' => 'message.pdf',
          'hash' => '3f9fa1aef7fe3b3e7c431baacf79dd94aa60c4288ea52b78b508fe47ccb882f0',
          'mime' => 'application/pdf',
          'size' => 8118,
          'url' => 'https://silo.invopop.com/mNzZ90MTEe2P-AJoVTqybA/TNqM2l-HReGSmTJVa_sbiA/message.pdf?h=3f9fa1aef7fe3b3e'
        }
      ]
    }
  end

  include_examples 'Shared Struct Examples', :job

  it 'parses times as Time objects' do
    expect(job.created_at).to be_a(Time)
    expect(job.updated_at).to be_a(Time)
    expect(job.completed_at).to be_a(Time)
  end

  it 'parses `tags` as an array of strings' do
    expect(job.tags).to eq(%w[test message])
  end

  it 'parses `intents` as an array of Intent objects' do
    expect(job.intents.size).to be(1)
    expect(job.intents.first).to be_an(Invopop::Transform::Intent)
    expect(job.intents.first.id).to eq('4cda8cda-5f87-45e1-9299-32556bfb1b88')
  end

  it 'parses `envelope` as a GOBL::Envelope object' do
    expect(job.envelope).to be_a(GOBL::Envelope)
    expect(job.envelope.extract.content).to eq('Hello world!')
  end

  it 'parses `attachments` as an array of Attachment objects' do
    expect(job.attachments.size).to be(1)
    expect(job.attachments.first).to be_a(Invopop::Transform::Attachment)
    expect(job.attachments.first.name).to eq('message.pdf')
  end
end
