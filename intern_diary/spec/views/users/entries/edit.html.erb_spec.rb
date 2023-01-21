require 'rails_helper'

RSpec.describe "users/entries/edit", type: :view do
  let(:users_entry) {
    Entry.create!()
  }

  before(:each) do
    assign(:users_entry, users_entry)
  end

  it "renders the edit users_entry form" do
    render

    assert_select "form[action=?][method=?]", users_entry_path(users_entry), "post" do
    end
  end
end
