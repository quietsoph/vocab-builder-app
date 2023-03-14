class FamiliesController < ApplicationController
  before_action :check_for_login

  def index
    # INCLUDE THE SEARCH INSIDE THE INDEX PAGE
    if params[:query].blank?
      @families = Family.all
    else
      @parameter = params[:query].downcase
      @families = Family.where("lower(text) LIKE :query", query: "%#{@parameter}%")
    end

    # NEW Family FORM INSIDE THE INDEX PAGE
    @family = Family.new

  end

  #  REDIRECT NEW_Family_PATH TO families_PATH AS NEW Family FORM INSIDE THE INDEX PAGE
  def new
    redirect_to families_path
  end

  def create
    family = Family.create family_params
    @current_user.families << family
    redirect_to families_path
  end

  # EDIT Family FORM
  def edit
    @family = Family.find(params[:id])
  end

  # UPDATE
  def update
    @family = Family.find params[:id]
    @family.update family_params
    redirect_to family_path
  end

  # DELETE
  def destroy
    @family = Family.find params[:id]
    @family.destroy
    redirect_to families_path
  end

  # SHOW PAGE
  def show
    @family = Family.find params[:id]
  end

  private
  def family_params
    params.require(:Family).permit(:text)
  end

end
