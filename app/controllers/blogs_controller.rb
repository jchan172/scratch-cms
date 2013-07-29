class BlogsController < ApplicationController
  before_action :signed_in_user, :except => [:show]
  
  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
    @blogentries = @blog.blogentries
  end

  def manage
    @blog = Blog.find(params[:id])
    @blogentries = @blog.blogentries
  end

  def show
    @blog = Blog.find(params[:id])
    @blogentries = @blog.blogentries
  end

  def index
    @blogs = current_user.blogs
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(blog_params)
      flash[:success] = "Blog updated!"
      redirect_to '/dashboard'
    else
      render 'edit'
    end
  end

  def destroy
    Blog.find(params[:id]).destroy
    flash[:success] = "Blog deleted."
    redirect_to '/dashboard'
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      flash[:success] = "Blog created successfully!"
      redirect_to '/dashboard'
    else
      render 'new'
    end
  end

  private

    def blog_params
      params.require(:blog).permit(:content, :title)
    end

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end
    
end
