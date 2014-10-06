class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to params[:url_param]
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to params[:comment][:url_param]
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end