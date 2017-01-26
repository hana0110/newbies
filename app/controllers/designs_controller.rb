class DesignsController < ApplicationController

  def index
    @designs = Design.all
  end

  def new
  end

  def create
    Design.create(image: design_params[:image], tag: design_params[:tag_list], text: design_params[:text], user_id: current_user.id)
  end

  def search
    keyword = "%#{params[:keyword]}"
    @designs = Design.tagged_with([keyword])
  end

  def categories
  end

  def show
    @design = Design.find(params[:id])
  end

  private
  def design_params
    paramas.require(:design).permit(:design_id, :image, :mood_list, :color_list, :roomtype_list, :text)
  end

end
