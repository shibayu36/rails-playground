# frozen_string_literal: true

require 'rails_helper'

RSpec.xdescribe 'entries/edit', type: :view do
  let(:entry) do
    Entry.create!
  end

  before do
    assign(:entry, entry)
  end

  it 'renders the edit entry form' do
    render

    assert_select 'form[action=?][method=?]', entry_path(entry), 'post' do
    end
  end
end
