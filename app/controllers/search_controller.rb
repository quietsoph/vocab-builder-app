class SearchController < ApplicationController
  def index
    @query = Root.ransack(params[:q])
    @roots = @query.result(distinct: true)
  end
end
