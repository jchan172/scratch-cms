class BlogentriesController < ApplicationController
  before_filter :signed_in_user

  def new
    @blogentry = Blogentry.new
  end

  def edit
    @blogentry = Blogentry.find(params[:id])
  end

  def destroy
    Blogentry.find(params[:id]).destroy
    flash[:success] = "Blog Entry Deleted."
    redirect_to '/dashboard'
  end

  def update
    @blogentry = Blogentry.find(params[:id])
    if @blogentry.update_attributes(params[:blogentry])
      flash[:success] = "Blog entry update!"
      redirect_to '/dashboard'
    else
      render 'edit'
    end
  end

  def create
    @blogentry = current_user.blogs.find(params[:blog][:id]).blogentries.build(params[:blogentry])
    if @blogentry.save
      flash[:success] = "Blog entry created successfully!"
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
