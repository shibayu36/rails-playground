# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'entries/show', type: :view do
  before do
    assign(:entry, Entry.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
