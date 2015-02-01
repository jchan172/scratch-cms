class PagesController < ApplicationController
  def home
    @pcb = User.first.projects.find_by_title('PoE Measurement Board') rescue '#'
    @scratchcms = User.first.projects.find_by_title('Scratch CMS') rescue '#'
  	@quadrotor = User.first.projects.find_by_title('Radiation Mapping') rescue '#'
  	@ddr = User.first.projects.find_by_title('DDR') rescue '#'
  	@amp = User.first.projects.find_by_title('Pocket Amplifier') rescue '#'
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
