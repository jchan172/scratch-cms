class ProjectsController < ApplicationController
  before_filter :signed_in_user

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = current_user.projects
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:success] = "Project Updated!"
      redirect_to '/dashboard'
    else
      render 'edit'
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project Deleted."
    redirect_to '/dashboard'
  end

  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      flash[:success] = "Project created successfully"
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
