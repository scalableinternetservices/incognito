class PostsController < ApplicationController
    before_action :extract_post, only: [:show, :edit,:update,:destroy]
    def index 
        @posts = Post.all.order("created_at DESC")
    end 

    def new
        @post = Post.new
    end 

    def create 
        @post = Post.new(post_params)
            if @post.save 
                redirect_to @post, notice: "Post created successfully !"
            else 
                render :new, alert: "Post creation failed, try again"
            end
    end 

    def show 
    end 

    def edit 
    end


    def update 
        if @post.update(post_params) 
            redirect_to @post, notice:"Your post is updated succussfully!"
        else 
            render :edit, alert: "Oops, edit failed!"
        end
    end 

    def destroy
        @post.destroy
        redirect_to posts_path
        
    end 

    private 
    def post_params
        params.require(:post).permit(:title,:body)
    end 

    def extract_post 
        @post = Post.find(params[:id])
    end 


end
