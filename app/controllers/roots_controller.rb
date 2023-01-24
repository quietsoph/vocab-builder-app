class RootsController < ApplicationController
  def index
    @roots = Root.all
    @root = Root.new
  end

  def create
    @root = Root.create root_params
    redirect_to roots_path
  end

  def root_params
    params.require(:root).permit(:text)
  end

end
