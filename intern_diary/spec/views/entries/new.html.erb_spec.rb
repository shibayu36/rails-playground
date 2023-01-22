# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'entries/new', type: :view do
  before do
    assign(:entry, Entry.new)
  end

  it 'renders new entry form' do
    render

    assert_select 'form[action=?][method=?]', entries_path, 'post' do
    end
  end
end
