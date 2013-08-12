class CustompagesController < ApplicationController
  before_action :signed_in_user, :except => [:show]

  def new
    @custompage = Custompage.new
  end

  def edit
    @custompage = Custompage.find(params[:id])
  end

  def show
    @custompage = Custompage.find(params[:id])
    if @custompage.draft == true
      redirect_to root_path
    end
  end

  def index
    @custompages = current_user.custompages
  end

  def update
    @custompage = Custompage.find(params[:id])
    if @custompage.update_attributes(custompage_params)
      flash[:success] = "Custom Category page updated!"
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  def destroy
    Custompage.find(params[:id]).destroy
    flash[:success] = "custompage deleted."
    redirect_to dashboard_path
  end

  def create
    @custompage = current_user.custompages.build(custompage_params)
    if @custompage.save
      flash[:success] = "custompage created successfully!"
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  private

    def custompage_params
      params.require(:custompage).permit(:content, :title, :draft)
    end

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end

end
