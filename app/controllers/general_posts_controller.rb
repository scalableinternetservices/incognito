class GeneralPostsController < ApplicationController
  def index
    @posts = Post.where(public: true).order("created_at DESC") if stale?(Post.all)
  end
end
