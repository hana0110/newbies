class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @user_id = current_user.id
    @design_id = Design.find(params[:id]).id
    @favorite = Favorite.new(design_id: @design_id, user_id: @user_id)
    if @favorite.save
      redirect_to "/"
    end
  end

  def destroy
    @user_id = current_user.id
    @design = Design.find(params[:id])
    @favorite = Favorite.find_by user_id: @user_id, design_id: params[:id]
    if @favorite.destroy
      redirect_to "/"
    end
  end

end