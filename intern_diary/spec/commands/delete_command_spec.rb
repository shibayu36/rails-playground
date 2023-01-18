# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeleteCommand do
  describe '.exec' do
    context 'when a user does not exist' do
      it 'returns error message' do
        expect(described_class.exec('new_username', 1)).to eq 'User not found'
      end
    end

    context 'when a user does not have a diary' do
      let(:user) { create(:user) }

      it 'returns error message' do
        expect(described_class.exec(user.name, 1)).to eq 'Diary not found'
      end
    end

    context 'when a user has a diary' do
      let(:user) { create(:user) }
      let!(:diary) { create(:diary, user:) }

      context 'when an entry does not exist' do
        it 'returns error message' do
          expect(described_class.exec(user.name, 1)).to eq 'Entry not found'
        end
      end

      context 'when an entry written by another user is passed' do
        let(:another_user) { create(:user) }
        let(:another_diary) { create(:diary, user: another_user) }
        let(:another_entry) { create(:entry, diary: another_diary) }

        it 'returns error message' do
          expect(described_class.exec(user.name, another_entry.id)).to eq 'Entry not found'
        end
      end

      context 'when an entry exists' do
        let!(:entry1) { create(:entry, diary:) }
        let!(:entry2) { create(:entry, diary:) }

        it 'deletes an entry' do
          expect(diary.entries.size).to eq 2
          expect(described_class.exec(user.name, entry1.id)).to be_nil
          expect(diary.reload.entries.size).to eq 1
          expect(diary.reload.entries[0].id).to eq entry2.id
        end
      end
    end
  end
end
