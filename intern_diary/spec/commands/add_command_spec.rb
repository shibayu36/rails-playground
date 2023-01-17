# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AddCommand do
  describe '.exec' do
    context 'when a user does not exist' do
      it 'creates a new user, and posts an entry' do
        described_class.exec('new_username', 'title', 'body')

        user = User.find_by(name: 'new_username')
        expect(user).to be_present
        expect(user.diary.name).to eq "new_username's diary"
        expect(user.diary.entries.size).to eq 1
        expect(user.diary.entries[0]).to have_attributes(title: 'title', body: 'body')
      end

      context 'when passed username is invalid' do
        it 'returns error message' do
          expect(described_class.exec('a', 'title', 'body')).to eq 'Name is too short (minimum is 3 characters)'
        end
      end
    end

    context 'when an user does not have a diary' do
      let(:user) { create(:user) }

      it 'creates a diary and adds an entry' do
        expect(user.diary).to be_nil

        described_class.exec(user.name, 'title', 'body')
        user.reload

        expect(user.diary.name).to eq "#{user.name}'s diary"
        expect(user.diary.entries.size).to eq 1
        expect(user.diary.entries[0]).to have_attributes(title: 'title', body: 'body')
      end
    end

    context 'when an user has a diary' do
      let(:user) { create(:user) }

      before do
        create(:diary, user:)
      end

      it 'adds an entry' do
        expect(user.diary.entries).to be_empty

        described_class.exec(user.name, 'title1', 'body1')
        described_class.exec(user.name, 'title2', 'body2')

        expect(user.diary.entries.size).to eq 2
        expect(user.diary.entries[0]).to have_attributes(title: 'title1', body: 'body1')
        expect(user.diary.entries[1]).to have_attributes(title: 'title2', body: 'body2')
      end

      context 'when passed title is invalid' do
        it 'returns error message' do
          expect(
            described_class.exec(user.name, 'a' * 101, 'body1')
          ).to eq 'Title is too long (maximum is 100 characters)'
        end
      end
    end
  end
end
