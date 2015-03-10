class SearchesController < ApplicationController
  def show
    @results = perform_search.results
  end

  private

  def perform_search
    Shout.search do
      fulltext query
    end
  end

  def query
    params[:search][:query]
  end
end
