require 'rails_helper'

RSpec.describe "users/entries/show", type: :view do
  before(:each) do
    assign(:users_entry, Entry.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
