class PostsController < ApplicationController
    before_action :extract_post, only: [:show, :edit,:update,:destroy]
    def index 
        if !current_user 
            redirect_to generalposts_path
        else
            current_uni = current_user.university_acronym
        end
        @posts = Post.where(university: current_uni, public: false).order("created_at DESC")
    end 

    def new
        @post = Post.new
    end 

    def create 
        if !current_user or current_user.write == false
            redirect_to generalposts_path, alert: "Not logged in or do not have write access without valid college!"
            return
        end
        value = current_user.university_acronym
        @post = Post.new(post_params(value))

        if @post.save 
            redirect_to @post, notice: "Post created successfully !"
        else 
            render :new, alert: "Post creation failed, try again"
        end
    end 

    def show 
        @comment =Comment.new
        @comments = @post.comments.order("created_at DESC")
    end 

    def edit 
    end


    def update 
        if @post.update(post_params(@post.university)) 
            redirect_to @post, notice:"Your post is updated successfully!"
        else 
            render :edit, alert: "Oops, edit failed!"
        end
    end 

    def destroy
        general = @post.public
        @post.destroy
        if general
            redirect_to generalposts_path
        else
            redirect_to posts_path
        end
    end 
    
    def upvote 
        @post = Post.find(params[:id])
        @post.upvote_by current_user
        redirect_back(fallback_location: root_path)
      end  
      
      def downvote
        @post = Post.find(params[:id])
        @post.downvote_by current_user
        redirect_back(fallback_location: root_path)
      end


    def search  
      if params[:search].blank?  
        redirect_to(root_path, alert: "Empty search field!") and return  
      else  
        @search_parameter = params[:search].downcase
        if current_user
            @university_parameter = current_user.university_acronym
            @results = Post.where(university: nil).or(Post.where("university = ?", @university_parameter)).where("lower(title) LIKE :search", search: "%#{@search_parameter}%")
        else
            @results = Post.where(university: nil).where("lower(title) LIKE :search", search: "%#{@search_parameter}%")
        end
      end  
    end

    private 
    def post_params(curr_uni)
        ret_hash = params.require(:post).permit(:title,:body,:user_id,:public)
        ret_hash[:user_id] = current_user.id
        ret_hash[:university] = curr_uni
    
        return ret_hash
    end 

    def extract_post 
        @post = Post.find(params[:id])
    end 



end
