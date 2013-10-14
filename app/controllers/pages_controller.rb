class PagesController < ApplicationController
  def home
    @pcb = User.first.projects.find_by_title('PoE Measurement Board')
    @scratchcms = User.first.projects.find_by_title('Scratch CMS')
  	@quadrotor = User.first.projects.find_by_title('Radiation Mapping')
  	@ddr = User.first.projects.find_by_title('DDR')
  	@amp = User.first.projects.find_by_title('Pocket Amplifier')
  end

  def about
  end

  def error
  end

  def gallery
  end

  def mysticartifact
  end
  
end
