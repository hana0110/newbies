class DesignsController < ApplicationController
    before_action :authenticate_user!, only: :new

  def index
    @designs = Design.page(params[:page]).per(5).order("created_at DESC")
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
    design.style_list.remove
    design.color_list.remove
    design.item_list.remove
    design.destroy
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
    # keyword = "%#{params[:keyword]}%"
    @designs = Design.tagged_with(params[:keyword]).order("created_at DESC")
  end

  def browse
  end

  def show
    @design = Design.find(params[:id])
  end

  private
  def design_params
    params.require(:design).permit(:user_id, :design_id, :style_list, :color_list, :item_list, :text, images_attributes: [:image, :design_id])
  end

end
