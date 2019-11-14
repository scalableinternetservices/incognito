class GeneralPostsController < ApplicationController
  def index
    @posts = Post.where(public: true).order("created_at DESC")
  end
end
