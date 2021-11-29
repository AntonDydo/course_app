class ResultsController < ApplicationController
  def index
    @search_results = Review.search(params[:query])
  end
end