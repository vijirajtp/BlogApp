class PostsController < ApplicationController



  def index
    @title = "Blog"
    @total = Post.count
    @posts = Post.find(:all)
    
  end

  def new
    @blog_post = Post.new
    @title = "Create new post"
    @categories = Category.find(:all)
    #@category = Category.find(params[:id])
   # @post = @category.posts
   #@title = @category.name
  end

  def create
    @title = "Create new post"
    @blog_post = Post.new(params[:blog_post])
    if @blog_post.save
      flash[:notice] = "Blog post has been published."
      redirect_to posts_path
    else
      render :action => 'new'
    end
  end

   def edit
    @blog_post = Post.find(params[:id])
    @title = @blog_post.title
   end

  def update
    @blog_post = Post.find(params[:id])
    @title = @blog_post.title
    if @blog_post.update_attributes(params[:blog_post])
      flash[:notice] = "Your changes has been saved and the post is published."
      redirect_to posts_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @blog_post = Post.find(params[:id])
    if @blog_post.destroy
      flash[:notice] = "Post was deleted successfully."
    end
    redirect_to posts_path
  end

  def categories
    @categories = Category.find(:all)
    @category = Category.new
    @total = Category.count
  end

    def create_category
        @category = Category.new(params[:category])
        if @category.save
          flash[:success] = "Category has been created."
          redirect_to categories_posts_path
        else
          render :action => 'new'
        end
    end

    def destroy
        @category = Category.find(params[:id])
        if @category.destroy
          flash[:notice] = "Post was deleted successfully."
        end
        redirect_to categories_posts_path
    end

    end
  
