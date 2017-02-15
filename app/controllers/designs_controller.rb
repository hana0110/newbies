class DesignsController < ApplicationController
    before_action :authenticate_user!, only: :new

  def index
    @designs = Design.all.order("created_at DESC")
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
    design.mood_list.remove
    design.color_list.remove
    design.roomtype_list.remove
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
    @user_id = current_user.id
    @design = Design.find(params[:id])
    @favorite = Favorite.where("user_id = ? and design_id = ?", @user_id, @design.id )
  end

  private
  def design_params
    params.require(:design).permit(:user_id, :design_id, :mood_list, :color_list, :roomtype_list, :text, images_attributes: [:image, :design_id])
  end

end
