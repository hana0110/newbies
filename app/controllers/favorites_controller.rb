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
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      redirect_to "/users/mypage"
    end
  end

end