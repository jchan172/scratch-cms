class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show, :edit, :delete]
  def new
    @user = User.new
  end

  def show  
    @user = User.find(params[:id])
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
      flash[:success] = "Welcome to Jack and Andys CMS!"
      redirect_to @user
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
      flash[:success] = "Profile updated"
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
