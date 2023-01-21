require 'rails_helper'

RSpec.describe "users/entries/new", type: :view do
  before(:each) do
    assign(:users_entry, Entry.new())
  end

  it "renders new users_entry form" do
    render

    assert_select "form[action=?][method=?]", users_entries_path, "post" do
    end
  end
end
