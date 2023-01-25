class RootsController < ApplicationController
  def index
    if params[:query].blank?
      @roots = Root.all
    else
      @parameter = params[:query].downcase
      @roots = Root.all.where("lower(text) LIKE :query", query: "%#{@parameter}%")
    end

    @root = Root.new

  end

  def create
    @root = Root.create root_params
    redirect_to roots_path
  end

  def edit
    @root = Root.find(params[:id])
  end


  def update
    @root = Root.find params[:id]
    @root.update root_params
    redirect_to root_path
  end

  def destroy
    @root = Root.find params[:id]
    @root.destroy
    redirect_to roots_path
  end

  def show
    @root = Root.find params[:id]
  end

  private
  def root_params
    params.require(:root).permit(:text)
  end

end
