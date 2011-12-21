require 'spec_helper'

describe Album do
  it "should have title and description if those were defined on creation" do
    album = Factory(:album)

    album.directory.should == "Vacations"
    album.title.should == "Summer Dream"
  end

end
