class UsersController < ApplicationController
  before_action :signed_in_user, only: [:show, :edit, :update, :delete, :index]
  
  def new
    if !User.first
      @user = User.new
    else 
      redirect_to root_path
    end
  end

  def show  
    # this is the case when someone goes to /dashboard, so we'll want to display the user's projects and blogs
    # if params[:id] == -1
      @user = current_user
      @projects = @user.projects.paginate(page: params[:page], :per_page => 10)
      @blogs = @user.blogs.paginate(page: params[:page], :per_page => 10)
      @custompages = @user.custompages.paginate(page: params[:page], :per_page => 10)

      respond_to do |format|
        format.html # renders show.html.erb
        format.js   # renders show.js.erb
      end
    # else
      # this is the case for when someone tries to show a user through entering url, such as /users/2
      # @user = User.find(params[:id])
      # redirect_to dashboard_path
    # end
  end

  def edit
    @user = current_user
  end
  
  def index
    @users = User.all
  end
  
  def create
    # Demo, so disable create
    # @user = User.new(user_params)
    # if @user.save
      flash[:success] = "Welcome to Scratch CMS! (no user was created; this is a demo)"
      # sign_in @user
      redirect_to dashboard_path
    # else
    #   render 'new'
    # end
  end
  
  def destroy
    # Demo, so disable delete
    # User.find(params[:id]).destroy()
  end
  
  def update
    # Demo, so disable update
    @user = User.find(params[:id])
    # if @user.update_attributes(user_params)
      flash[:success] = "Profile updated! (not really because this is a demo)"
      redirect_to @user
    # else
    #   render 'edit'
    # end
  end

  private

    def user_params
      params.require(:user).permit(:email, :name, :username, :password, :password_confirmation)
    end

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end

end
