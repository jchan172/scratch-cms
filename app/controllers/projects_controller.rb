class ProjectsController < ApplicationController
  before_action :signed_in_user, :except => [:show]

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
    if @project.update_attributes(project_params)
      flash[:success] = "Project updated!"
      redirect_to '/dashboard'
    else
      render 'edit'
    end
  end

  def update_special
    flash[:success] = "woooo"
    redirect_to '/dashboard'
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project deleted."
    redirect_to '/dashboard'
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created successfully!"
      redirect_to '/dashboard'
    else
      render 'new'
    end
  end

  private

    def project_params
      params.require(:project).permit(:content, :title)
    end

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end

end
