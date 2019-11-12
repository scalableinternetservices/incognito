class GeneralPostsController < ApplicationController
  def index
    @posts = Post.where(university: nil).order("created_at DESC")
  end
end
