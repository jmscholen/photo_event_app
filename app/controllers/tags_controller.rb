class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @new_tag = Tag.new 
  end

  def create
    @new_tag =  Tag.new(params_for_tag)
    @new_tag.save
    redirect_to tags_path
  end

  def edit
    @new_tag =  Tag.find(params[:id])
    @new_tag.update_attributes(params_for_tag)
    redirect_to tags_path    
  end

  def update
    @new_tag =  Tag.find(params[:id])
    @new_tag.update_attributes(params_for_tag)
    redirect_to tag_path     
  end

  def destroy
    @delete_tag = Tag.find(params[:id])
    @delete_tag.delete 
    redirect_to tags_path
  end

  private

  def params_for_tag
    params.require(:tag).permit(:name)
  end
  
end
