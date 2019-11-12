class PostsController < ApplicationController
    before_action :extract_post, only: [:show, :edit,:update,:destroy]
    def index 
        current_uni = current_user.university_acronym
        @posts = Post.where(university: current_uni).order("created_at DESC")
    end 

    def new
        @post = Post.new
    end 

    def create 
        if params[:post][:university] == "0"
            value = nil
        else
            value = current_user.university_acronym
        end
        @post = Post.new(post_params(value))

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
        if @post.update(post_params(@post.university)) 
            redirect_to @post, notice:"Your post is updated succussfully!"
        else 
            render :edit, alert: "Oops, edit failed!"
        end
    end 

    def destroy
        general = @post.university
        @post.destroy
        if general
            redirect_to posts_path
        else
            redirect_to generalposts_path
        end
    end 

    private 
    def post_params(curr_uni)
        ret_hash = params.require(:post).permit(:title,:body,:user_id)
        ret_hash[:user_id] = current_user.id
        ret_hash[:university] = curr_uni
        return ret_hash
    end 

    def extract_post 
        @post = Post.find(params[:id])
    end 


end
