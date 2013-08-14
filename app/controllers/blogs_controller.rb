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
    @blogentries = @blog.blogentries.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @blog = Blog.find(params[:id])
    @blogentries = @blog.blogentries.paginate(page: params[:page], :per_page => 10)
    if @blog.draft == true
      redirect_to root_path
    end
  end

  def index
    @blogs = current_user.blogs
  end

  def update
    # Demo, so disable update
    # @blog = Blog.find(params[:id])
    # if @blog.update_attributes(blog_params)
      flash[:success] = "Blog updated! (not really because this is a demo)"
      redirect_to dashboard_path
    # else
    #   render 'edit'
    # end
  end

  def destroy
    # Demo, so disable delete
    # Blog.find(params[:id]).destroy
    flash[:success] = "Blog deleted. (not really because this is a demo)"
    redirect_to dashboard_path
  end

  def create
    # Demo, so disable create
    # @blog = current_user.blogs.build(blog_params)
    # if @blog.save
      flash[:success] = "Blog created successfully! (not really because this is a demo)"
      redirect_to dashboard_path
    # else
    #   render 'new'
    # end
  end

  private

    def blog_params
      params.require(:blog).permit(:content, :title, :draft)
    end

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end
    
end
