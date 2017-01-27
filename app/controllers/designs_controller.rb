class DesignsController < ApplicationController
    before_action :authenticate_user!, only: :new

  def index
    @designs = Design.all
  end

  def new
    @design = Design.new
    @design.images.build
  end

  def create
    design = Design.new(design_params)
    design.save
  end

  def destroy
    design = Design.find(params[:id])
    if design.user_id == current_user.id
      design.destroy
    end
  end

  def edit
    @design = Design.find(params[:id])
  end

  def update
    design = Design.find(params[:id])
    if design.user_id == current_user.id
      design.update(design_params)
    end
  end

  def search
    keyword = "%#{params[:keyword]}%"
    @designs = Design.tagged_with([keyword])
  end

  def categories
  end

  def show
    @design = Design.find(params[:id])
  end

  private
  def design_params
    params.require(:design).permit(:user_id, :design_id, :mood_list, :color_list, :roomtype_list, :text, images_attributes: [:image, :design_id])
  end

end
