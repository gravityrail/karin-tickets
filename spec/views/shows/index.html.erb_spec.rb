require 'spec_helper'

describe "shows/index.html.erb" do
  before(:each) do
    assign(:shows, [
      stub_model(Show,
        :name => "Name",
        :byline => "Byline",
        :tagline => "Tagline",
        :description => "MyText",
        :credits => "MyText",
        :quotes => "MyText"
      ),
      stub_model(Show,
        :name => "Name",
        :byline => "Byline",
        :tagline => "Tagline",
        :description => "MyText",
        :credits => "MyText",
        :quotes => "MyText"
      )
    ])
  end

  it "renders a list of shows" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Byline".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tagline".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
