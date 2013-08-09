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
  end

  def index
    @custompages = current_user.custompages
  end

  def update
    @custompage = Custompage.find(params[:id])
    if @custompage.update_attributes(custompage_params)
      flash[:success] = "custompage updated!"
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
    Custompage.find(params[:id]).destroy
    flash[:success] = "custompage deleted."
    redirect_to '/dashboard'
  end

  def create
    @custompage = current_user.custompages.build(custompage_params)
    if @custompage.save
      flash[:success] = "custompage created successfully!"
      redirect_to '/dashboard'
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
