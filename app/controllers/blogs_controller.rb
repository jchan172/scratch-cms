class BlogsController < ApplicationController
  before_action :signed_in_user, :except => [:show]
  
  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.friendly.find(params[:id])
    @blogentries = @blog.blogentries
  end

  def manage
    @blog = Blog.friendly.find(params[:id])
    @blogentries = @blog.blogentries.paginate(page: params[:page], :per_page => 10) # each blogentry sorted by created_at
  end

  def show
    privileged = (params[:privileged].downcase rescue 'false') == 'yes'
    @blog = Blog.friendly.find(params[:id])
    # don't paginate the results, show all on one page
    @blogentries = @blog.blogentries
    if (@blog.draft == true && !privileged)
      redirect_to root_path
    end
  end

  def index
    @blogs = current_user.blogs
  end

  def update
    @blog = Blog.friendly.find(params[:id])
    if @blog.update_attributes(blog_params)
      flash[:success] = "Blog updated!"
      redirect_to dashboard_path(:link => "blogs")
    else
      render 'edit'
    end
  end

  def destroy
    Blog.friendly.find(params[:id]).destroy
    flash[:success] = "Blog deleted."
    redirect_to dashboard_path(:link => "blogs")
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      flash[:success] = "Blog created successfully!"
      redirect_to dashboard_path(:link => "blogs")
    else
      render 'new'
    end
  end

  private

    def blog_params # strong params
      params.require(:blog).permit(:content, :title, :draft)
    end

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end
    
end
