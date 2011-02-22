require 'spec_helper'

describe "shows/new.html.erb" do
  before(:each) do
    assign(:show, stub_model(Show,
      :name => "MyString",
      :byline => "MyString",
      :tagline => "MyString",
      :description => "MyText",
      :credits => "MyText",
      :quotes => "MyText"
    ).as_new_record)
  end

  it "renders new show form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => shows_path, :method => "post" do
      assert_select "input#show_name", :name => "show[name]"
      assert_select "input#show_byline", :name => "show[byline]"
      assert_select "input#show_tagline", :name => "show[tagline]"
      assert_select "textarea#show_description", :name => "show[description]"
      assert_select "textarea#show_credits", :name => "show[credits]"
      assert_select "textarea#show_quotes", :name => "show[quotes]"
    end
  end
end
