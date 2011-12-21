require 'spec_helper'

describe "Albums" do
  before do
    @album1 = Factory(:album)
    @album2 = Factory(:album, :title=>"Winter Break")
  end

  it "should show me the page of albums with titles and directories" do
    visit albums_path

    page.should have_content(@album1.title)
    page.should have_content(@album2.title)
    page.should have_content(@album2.directory)
  end
end
