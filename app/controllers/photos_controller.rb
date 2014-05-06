class PhotosController < ApplicationController
  def index
    @photos = Photo.all 
  end

  def new
    @new_photo = Photo.new
  end

  def create
    @new_photo = Photo.new(params_for_photo)
    @new_photo.save
    redirect_to photos_path
  end

  def edit
    @edit_photo = Photo.find(params[:id])
    @edit_photo.update_attributes(params_for_photo)
    redirect_to photos_path
  end

  def update
    @edit_photo = Photo.find(params[:id])
    @edit_photo.update_attributes(params_for_photo)
    redirect_to photo_path
  end

  def destroy
    @delete_photo = Photo.find(params[:id])
    @delete_photo.delete 
    redirect_to photos_path 
  end

  def download_image
    @photo = Photo.find(params[:id])
    file = @photo.image 
    send_file file.path
  end

  private

  def params_for_photo
    params.require(:photo).permit(:name, :description, :price, :image)
  end
end
