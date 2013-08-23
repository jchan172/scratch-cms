class PagesController < ApplicationController
  def home
  	@quadrotor = User.first.projects.find_by_title('Radiation Mapping')
  	@gallery = User.first.projects.find_by_title('Photography')
  	@ddr = User.first.projects.find_by_title('DDR')
  	@amp = User.first.projects.find_by_title('Pocket Amplifier')
  end

  def about
  end

  def error
  end

  def gallery
  end
end
