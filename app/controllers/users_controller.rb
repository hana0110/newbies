class UsersController < ApplicationController

  before_action :authenticate_user!, only: :show
  
  def show
    @user = User.find(current_user.id)
    @favorites = Favorite.where("user_id = ?", @user).order("created_at DESC")
    @design = Design.where("user_id = ?", @user).order("created_at DESC")
  end
end
