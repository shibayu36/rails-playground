# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AddCommand do
  describe '.exec' do
    context 'when a user does not exist' do
      it 'creates a new user, and posts an entry' do
        AddCommand.exec('new_username', 'title', 'body')

        user = User.find_by(name: 'new_username')
        expect(user).to be_present
        expect(user.diary.name).to eq "new_username's diary"
        expect(user.diary.entries.size).to eq 1
        expect(user.diary.entries[0]).to have_attributes(title: 'title', body: 'body')
      end
    end

    context 'when an user does not have a diary' do
      let(:user) { create(:user) }

      it 'creates a diary and adds an entry' do
        expect(user.diary).to be_nil

        AddCommand.exec(user.name, 'title', 'body')
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

        AddCommand.exec(user.name, 'title1', 'body1')
        AddCommand.exec(user.name, 'title2', 'body2')

        expect(user.diary.entries.size).to eq 2
        expect(user.diary.entries[0]).to have_attributes(title: 'title1', body: 'body1')
        expect(user.diary.entries[1]).to have_attributes(title: 'title2', body: 'body2')
      end
    end
  end
end
