# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe '#to_terminal_output' do
    let(:entry) do
      build(
        :entry,
        title: 'title1',
        body: "body1\nbody2",
        created_at: Time.zone.local(2022, 3, 8)
      )
    end

    it 'returns terminal output' do
      expect(entry.to_terminal_output).to eq <<~EOS
        [#{entry.id}] title1 @2022-03-08
        body1
        body2
      EOS
    end
  end
end
