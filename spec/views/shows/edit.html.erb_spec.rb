require 'spec_helper'

describe "shows/edit.html.erb" do
  before(:each) do
    @show = assign(:show, stub_model(Show,
      :new_record? => false,
      :name => "MyString",
      :byline => "MyString",
      :tagline => "MyString",
      :description => "MyText",
      :credits => "MyText",
      :quotes => "MyText"
    ))
  end

  it "renders the edit show form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => show_path(@show), :method => "post" do
      assert_select "input#show_name", :name => "show[name]"
      assert_select "input#show_byline", :name => "show[byline]"
      assert_select "input#show_tagline", :name => "show[tagline]"
      assert_select "textarea#show_description", :name => "show[description]"
      assert_select "textarea#show_credits", :name => "show[credits]"
      assert_select "textarea#show_quotes", :name => "show[quotes]"
    end
  end
end
