# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    subject { user.valid? }

    let(:user) { build(:user, name:) }
    let(:name) { 'John' }

    context 'when name is valid' do
      it { is_expected.to be true }
    end

    context 'when name is too short' do
      let(:name) { 'a' }

      it { is_expected.to be false }
    end

    context 'when name is too long' do
      let(:name) { 'a' * 101 }

      it { is_expected.to be false }
    end
  end

  describe 'Deleting association' do
    context 'when an user has a diary and the user is deleted' do
      let(:user) { create(:user) }

      before do
        create(:diary, user:)
      end

      it 'also deletes a diary' do
        expect(user.diary).to be_present

        user.destroy

        expect(Diary.find_by(user_id: user.id)).to be_nil
      end
    end
  end

  describe '#recent_entries' do
    context 'when a user has a diary' do
      let(:user) { create(:user) }
      let(:diary) { create(:diary, user:) }

      before do
        create(:entry, diary:)
        create(:entry, diary:)
      end

      it 'returns recent entries of the diary' do
        expect(user.recent_entries).to eq diary.entries.recent_ordered
      end
    end

    context 'when a user does not have a diary' do
      let(:user) { create(:user) }

      it 'returns an empty array' do
        expect(user.recent_entries).to eq []
      end
    end
  end
end
