# frozen_string_literal: true

RSpec.shared_examples 'Shared Struct Examples' do |subject_name|
  subject(subject_name) do
    described_class.new(data)
  end

  it 'provides a property getter for each data key' do
    data.each_key do |key|
      expect(subject).to respond_to(key)
      expect(subject.public_send(key)).not_to be_nil
    end
  end
end
