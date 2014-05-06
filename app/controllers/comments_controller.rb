class CommentsController < ApplicationController
  def index
    @comments = Comment.all

  end

  def new
    @new_comment = Comment.new
  end

  def create
    @new_commment = Comment.new(params_for_comment)
  end

  def edit
    @edit_comment = Comment.find(params[:id])
    @edit_comment.update_attributes(params_for_comment)
    redirect_to comments_path
  end


  def update
    @update_comment = Comment.find(params[:id])
    @update_comment.update_attributes(params_for_comment)
    redirect_to comment_path
  end

  def destroy
    @delete_comment = Comment.find(params[:id])
    @delete_comment.delete 
    redirect_to comments_path
  end

  private

  def params_for_comment
    params.require(:comments).permit(:content)
  end
end


