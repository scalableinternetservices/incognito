class CommentsController < ApplicationController
    before_action :set_post

  def create
    @comment=@post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    # redirect_back(fallback_location: @post)
    return
  end

  def destroy 
      @comment = @post.comments.find(params[:id])
      @comment.destroy
  end 

  def edit
    @comment = @post.comments.find(params[:id])
  end
  
  def update
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @post
    end 
     #
  end
  def show
  end 


  def upvote 
    @comment = @post.comments.find(params[:id])
    @comment.upvote_by current_user
    #redirect_back(fallback_location: root_path)
    redirect_back(fallback_location: @post)
  end  
  
  def downvote
    @comment = @post.comments.find(params[:id])
    @comment.downvote_by current_user
    #redirect_back(fallback_location: root_path)
    redirect_back(fallback_location: @post)
  end
  
  private 
  def comment_params 
    params.require(:comment).permit(:body, :id, :post_id)
  end
  def creation_params
    params.permit(:comment,:post_id, :id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
