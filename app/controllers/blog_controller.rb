class BlogController < ApplicationController

   def index
    @total= Post.count
    @posts= Post.find(:all)
    @categories= Category.find(:all)

  end

   def show
     @post = Post.find(params[:id])
     @comments= Comment.find_all_by_post_id(@post.id)
     @total= @comments.length
   end

   def categories
    @category= Category.find(params[:id])
    @posts=@category.posts
   end

   def create_comment
     @comment = Comment.new(params[:comment])
     @comment.post_id=params[:id]
      if @comment.save
          flash[:success] = "Comment has been published."
          redirect_to blog_path(params[:id])
        else
          render :action => 'show'
        end
   end

  def search
    @posts = Post.find( :all, :conditions => ["title LIKE ? OR content LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%"], :order => 'created_at DESC' ) if !params[:search].blank?
  end
   
end
