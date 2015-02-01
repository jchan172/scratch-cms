class BlogentriesController < ApplicationController
  before_action :signed_in_user

  def new
    @blogentry = Blogentry.new
    @blogid = params[:blogid]
  end

  def edit
    @blogentry = Blogentry.find(params[:id])
  end

  def destroy
    blogentry = Blogentry.find(params[:id])
    blog_id = blogentry.blog.id
    # Demo, so disable delete
    # blogentry.destroy
    flash[:success] = "Blog entry deleted. (not really because this is a demo)"
    redirect_to blogs_manage_path(blog_id)
  end

  def update
    # Demo, so disable update
    @blogentry = Blogentry.find(params[:id])
    blog_id = @blogentry.blog.id
    # if @blogentry.update_attributes(blogentry_params)
      flash[:success] = "Blog entry updated! (not really because this is a demo)"
      redirect_to blogs_manage_path(blog_id)
    # else
    #   render 'edit'
    # end
  end

  def create
    # Demo, so disable create
    # @blogentry = current_user.blogs.find(params[:blog][:id]).blogentries.build(blogentry_params)
    # if @blogentry.save
      flash[:success] = "Blog entry created successfully! (not really because this is a demo)"
      redirect_to blogs_manage_path(params[:blog][:id])
    # else
    #   render 'new'
    # end
  end

  private

    def blogentry_params
      params.require(:blogentry).permit(:content, :title, :blog_id, :created_at, :draft)
    end

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end
    
end
