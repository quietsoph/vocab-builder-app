class ConceptsController < ApplicationController

  def index
    if params[:query].blank?
      @concepts = Concept.all
    else
      @parameter = params[:query].downcase
      @concepts = Concept.all.where("lower(text) LIKE :query", query: "%#{@parameter}%")
    end
  end

  def new
    @concept = Concept.new
  end

  def create
    @concept = Concept.create concept_params
    redirect_to concepts_path
  end

  def edit
    @concept = Concept.find(params[:id])
  end

  def update
    @concept = Concept.find(params[:id])
    @concept.update concept_params
    redirect_to concept_path
  end

  def show
    @concept = Concept.find(params[:id])
  end

  def destroy
    @concept = Concept.find(params[:id])
    @concept.destroy
    redirect_to concepts_path
  end

  private
  def concept_params
    params.require(:concept).permit(:text, :meaning, :image, :example, :note, :root_ids => [],:linking_concept_ids => [])
  end
end
