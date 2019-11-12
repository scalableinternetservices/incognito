class CommentsController < ApplicationController
    before_action :set_post

  def create
    @comment=@post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    # redirect_back(fallback_location: @post)
  end

  private 
  def comment_params 
    params.require(:comment).permit(:body, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
