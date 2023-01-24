class ConceptsController < ApplicationController
  before_action :set_query

  def set_query
    @query = Concept.ransack(params[:q])
  end

  def index
    # @concepts = Concept.all

    @query = Concept.search(params[:q])
    @concepts = @query.result
    p "query now #{@query}"
    p "concepts now #{@concepts_found}"
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
    #raise 'hell'
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
    params.require(:concept).permit(:text, :meaning, :image, :example, :note)
  end
end
