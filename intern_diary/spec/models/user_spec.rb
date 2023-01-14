# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
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
end
