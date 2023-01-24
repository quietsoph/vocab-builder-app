class RootsController < ApplicationController
  def index
    @roots = Root.all.sort_by { |root| [root.created_at, root.updated_at]}.reverse
    @root = Root.new
  end

  def create
    @root = Root.create root_params
    redirect_to roots_path
  end

  def update
    @root = Root.find params[:id]
    @root.update root_params
    redirect_to roots_path
  end

  private
  def root_params
    params.require(:root).permit(:text)
  end

end
