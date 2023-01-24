class PagesController < ApplicationController
  def home
    redirect_to search_path
  end
end
