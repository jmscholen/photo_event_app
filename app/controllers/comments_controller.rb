class CommentsController < ApplicationController
  def index
    @comments = Comment.all

  end

  def new
    @new_comment = Comment.new
  end

  def create
    @new_comment = Comment.new(comment_params)
    if @new_comment.save
      redirect_to photo_path(@new_comment.photo)
    else
      redirect_to :new
    end
  end

  def edit
    @edit_comment = Comment.find(params[:id])
  end


  def update
    @update_comment = Comment.find(params[:id])
    @update_comment.update_attributes(comment_params)
    redirect_to comment_path
  end

  def destroy
    @delete_comment = Comment.find(params[:id])
    @delete_comment.destroy
    redirect_to comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end
end


