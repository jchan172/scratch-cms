class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show, :edit, :delete, :index]
  def new
    @user = User.new
  end

  def show  
    # this is the case when someone goes to /dashboard, so we'll want to display the user's projects and blogs
    if params[:id] == -1
      @user = current_user
      @projects = @user.projects
      @blogs = @user.blogs

      respond_to do |format|
        format.html # renders show.html.erb
        format.js   # renders show.js.erb
      end
    else
      # this is the case for when someone tries to show a user through entering url, such as /users/2
      @user = User.find(params[:id])
      redirect_to '/dashboard'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.all
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to Scratch CMS!"
      sign_in @user
      redirect_to '/dashboard'
    else
      render 'new'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy()
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end
  
end
