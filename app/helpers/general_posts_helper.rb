module GeneralPostsHelper
  
  def cache_key_for_post_row(post)    
    "post-#{post.id}-#{post.updated_at}-#{post.comments.count}"  
  end
  
  def cache_key_for_post_page
    "post-page-#{Post.where(public: true).maximum(:updated_at)}"
  end
end
