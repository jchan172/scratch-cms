class BlogsController < ApplicationController
  before_filter :signed_in_user

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
    if @blog.update_attributes(params[:blog])
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
    @blog = current_user.blogs.build(params[:blog])
    if @blog.save
      flash[:success] = "Blog created successfully!"
      redirect_to '/dashboard'
    else
      render 'new'
    end
  end

  private

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end
end
