# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ListCommand do
  describe '#exec' do
    context 'when a user does not exist' do
      it 'returns nil' do
        expect(described_class.exec('not_exist_user')).to be_nil
      end
    end

    context 'when a user does not have a diary' do
      let(:user) { create(:user) }

      it 'returns nil' do
        expect(described_class.exec(user.name)).to be_nil
      end
    end

    context 'when a user has entries' do
      let(:user) { create(:user) }
      let!(:other_user) { create(:user) }
      let!(:diary) { create(:diary, user:) }
      let!(:entry1) { create(:entry, diary:) }
      let!(:entry2) { create(:entry, diary:) }

      # Create other user's entries to confirm that the list command returns only the user's entries
      before do
        create(:entry, diary: create(:diary, user: create(:user)))
      end

      it 'lists entries with recent order' do
        entries = described_class.exec(user.name)
        expect(entries.size).to eq 2
        expect(entries[0]).to have_attributes(title: entry2.title, body: entry2.body)
        expect(entries[1]).to have_attributes(title: entry1.title, body: entry1.body)
      end
    end
  end
end
