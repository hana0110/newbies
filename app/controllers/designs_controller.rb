class DesignsController < ApplicationController

  def index
    @designs = Design.all
  end

  def new
  end

  def search
    @design.find_related_tag
  end

  def categories
  end

  def show
    @design = Design.find(params[:id])
  end

  private
  def design_params
    paramas.require(:design).permit(:image, :mood_list, :text)
  end

end
