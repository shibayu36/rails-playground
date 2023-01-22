# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'entries/index', type: :view do
  before do
    assign(:entries, [
             Entry.create!,
             Entry.create!
           ])
  end

  it 'renders a list of entries' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
