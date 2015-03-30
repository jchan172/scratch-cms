class ProjectsController < ApplicationController
  before_action :signed_in_user, :except => [:show]

  def new
    @project = Project.new
  end

  def edit
    @project = Project.friendly.find(params[:id])
  end

  def show
    @project = Project.friendly.find(params[:id])
    if @project.draft == true
      redirect_to root_path
    end
  end

  def index
    @projects = current_user.projects.paginate(page: params[:page], :per_page => 10)
  end

  def update
    @project = Project.friendly.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Project updated!"
      redirect_to dashboard_path(:link => "projects")
    else
      render 'edit'
    end
  end

  def destroy
    Project.friendly.find(params[:id]).destroy
    flash[:success] = "Project deleted."
    redirect_to dashboard_path(:link => "projects")
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created successfully!"
      redirect_to dashboard_path(:link => "projects")
    else
      render 'new'
    end
  end

  private

    def project_params # strong params
      params.require(:project).permit(:content, :title, :draft)
    end

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end

end
