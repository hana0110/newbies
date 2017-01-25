class DesignsController < ApplicationController

  def index
    @designs = Design.all
  end

  def new
  end

  def search
  end

  def categories
  end

  def mypage
  end

  def show
    @design = Design.find(params[:id])
  end

end
