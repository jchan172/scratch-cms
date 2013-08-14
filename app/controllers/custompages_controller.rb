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
    @custompages = current_user.custompages.paginate(page: params[:page], :per_page => 10)
  end

  def update
    # Demo, so disable update
    # @custompage = Custompage.find(params[:id])
    # if @custompage.update_attributes(custompage_params)
      flash[:success] = "Custom Category page updated! (not really because this is a demo)"
      redirect_to dashboard_path
    # else
    #   render 'edit'
    # end
  end

  def destroy
    # Demo, so disable delete
    # Custompage.find(params[:id]).destroy
    flash[:success] = "custompage deleted. (not really because this is a demo)"
    redirect_to dashboard_path
  end

  def create
    # Demo, so disable create
    # @custompage = current_user.custompages.build(custompage_params)
    # if @custompage.save
      flash[:success] = "custompage created successfully! (not really because this is a demo)"
      redirect_to dashboard_path
    # else
    #   render 'new'
    # end
  end

  private

    def custompage_params
      params.require(:custompage).permit(:content, :title, :draft)
    end

    def signed_in_user
      redirect_to login_url, notice: "Please sign in." unless signed_in?
    end

end
