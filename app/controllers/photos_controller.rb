class PhotosController < ApplicationController
  http_basic_authenticate_with :name => "admin", :password => "admin", :except => [:show]
  # GET /photos
  # GET /photos.json
  def index
    @album = Album.find(params[:album_id])
    @photos = @album.photos

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @album = Album.find(params[:album_id])
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.build(params[:photo])

    respond_to do |format|
      if @photo.save
        format.html { redirect_to album_photo_url(@photo, :album_id=>@album.id), notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        format.html { redirect_to album_photo_path, notice: 'Photo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])
    @album.photos.delete(@photo)
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to album_photos_url }
      format.json { head :ok }
    end
  end
end
