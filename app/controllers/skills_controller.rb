class SkillsController < ApplicationController
  def index
    @skills = Skill.order(:name).where("name like ?", "%#{params[:term]}%").limit(10)
    render :json => @skills.map(&:name)
  end
end
