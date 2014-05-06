class PhotosController < ApplicationController
  def index
    @photos = Photo.all 
  end

  def show
    @photo = Photo.find(params[:id])
    @new_comment = @photo.comments.build
  end
  def new
    @new_photo = Photo.new
  end

  def create
    @new_photo = Photo.new(photo_params)
    @new_photo.save
    redirect_to photos_path
  end

  def edit
    @edit_photo = Photo.find(params[:id])
  end

  def update
    @edit_photo = Photo.find(params[:id])
    @edit_photo.update_attributes(photo_params)
    redirect_to photo_path
  end

  def destroy
    @delete_photo = Photo.find(params[:id])
    @delete_photo.delete 
    redirect_to photos_path 
  end

  # def download_image
  #   @photo = Photo.find(params[:id])
  #   file = @photo.image 
  #   send_file file.path
  # end

  private

  def photo_params
    params.require(:photo).permit(:name, :description, :price, :image)
  end
end
