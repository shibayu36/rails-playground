require 'rails_helper'

RSpec.describe "users/entries/index", type: :view do
  before(:each) do
    assign(:entries, [
      Entry.create!(),
      Entry.create!()
    ])
  end

  it "renders a list of users/entries" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
