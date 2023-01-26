class RootsController < ApplicationController
  def index
    # INCLUDE THE SEARCH FOR ROOT INSIDE THE INDEX PAGE
    if params[:query].blank?
      @roots = Root.all
    else
      @parameter = params[:query].downcase
      @roots = Root.all.where("lower(text) LIKE :query", query: "%#{@parameter}%")
    end

    # NEW ROOT FORM INSIDE THE INDEX PAGE
    @root = Root.new

  end

  #  REDIRECT NEW_ROOT_PATH TO ROOTS_PATH AS NEW ROOT FORM INSIDE THE INDEX PAGE
  def new
    redirect_to roots_path
  end

  def create
    @root = Root.create root_params
    redirect_to roots_path
  end

  # EDIT ROOT FORM
  def edit
    @root = Root.find(params[:id])
  end

  # UPDATE
  def update
    @root = Root.find params[:id]
    @root.update root_params
    redirect_to root_path
  end

  # DELETE
  def destroy
    @root = Root.find params[:id]
    @root.destroy
    redirect_to roots_path
  end

  # SHOW PAGE
  def show
    @root = Root.find params[:id]
  end

  private
  def root_params
    params.require(:root).permit(:text)
  end

end
