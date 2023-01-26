class ConceptsController < ApplicationController

  def index
    # SEARCH INSIDE THE INDEX
    if params[:query].blank?
      @concepts = Concept.all
    else
      @parameter = params[:query].downcase
      @concepts = Concept.all.where("lower(text) LIKE :query", query: "%#{@parameter}%")
    end
  end

  # NEW FORM
  def new
    @concept = Concept.new
  end

  # CREATE
  def create
    @concept = Concept.create concept_params
    redirect_to concepts_path
  end

  # EDIT FORM
  def edit
    @concept = Concept.find(params[:id])
  end

  # UPDATE
  def update
    @concept = Concept.find(params[:id])
    @concept.update concept_params
    redirect_to concept_path
  end

  # INFO PAGE OF EACH CONCEPT
  def show
    @concept = Concept.find(params[:id])
  end

  # DELETE
  def destroy
    @concept = Concept.find(params[:id])
    @concept.destroy
    redirect_to concepts_ls path
  end

  private
  def concept_params
    params.require(:concept).permit(:text, :meaning, :image, :example, :note, :source, :translation, :category_id, :root_ids => [],:linking_concept_ids => [] )
  end
end
