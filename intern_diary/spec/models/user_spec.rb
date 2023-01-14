# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context 'hoge' do
    let(:user) { create(:user) }

    it do
      p(user.name)
    end
  end
end
