class BlogentriesController < ApplicationController
  before_action :signed_in_user

  def new
    @blogentry = Blogentry.new
  end

  def edit
    @blogentry = Blogentry.find(params[:id])
  end

  def destroy
    Blogentry.find(params[:id]).destroy
    flash[:success] = "Blog entry deleted."
    redirect_to '/dashboard'
  end

  def update
    @blogentry = Blogentry.find(params[:id])
    if @blogentry.update_attributes(blogentry_params)
      flash[:success] = "Blog entry updated!"
      redirect_to '/dashboard'
    else
      render 'edit'
    end
  end

  def create
    @blogentry = current_user.blogs.find(params[:blog][:id]).blogentries.build(blogentry_params)
    if @blogentry.save
      flash[:success] = "Blog entry created successfully!"
      redirect_to '/dashboard'
    else
      render 'new'
    end
  end

  private

    def blogentry_params
      params.require(:blogentry).permit(:content, :title, :blog_id, :created_at)
    end

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end
    
end
