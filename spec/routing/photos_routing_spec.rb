require "spec_helper"

describe PhotosController do
  describe "routing" do

    it "routes to #index" do
      get("/albums/1/photos").should route_to("photos#index", :album_id => '1')
    end

    it "routes to #new" do
      get("/albums/1/photos/new").should route_to("photos#new", :album_id => '1')
    end

    it "routes to #show" do
      get("/albums/1/photos/1").should route_to("photos#show", :id => "1", :album_id => '1')
    end

    it "routes to #edit" do
      get("/albums/1/photos/1/edit").should route_to("photos#edit", :id => "1", :album_id => '1')
    end

    it "routes to #create" do
      post("/albums/1/photos").should route_to("photos#create", :album_id => '1')
    end

    it "routes to #update" do
      put("/albums/1/photos/1").should route_to("photos#update", :id => "1", :album_id => '1')
    end

    it "routes to #destroy" do
      delete("/albums/1/photos/1").should route_to("photos#destroy", :id => "1", :album_id => '1')
    end

  end
end
