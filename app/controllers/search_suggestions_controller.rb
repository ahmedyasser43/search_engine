class SearchSuggestionsController < ApplicationController

  # GET /search_suggestions
  def index
    ip_adderss = request.remote_ip
    search_suggestions_serivce = SearchSuggestionsService.new
    search_suggestions = search_suggestions_serivce.get_matching_suggestions(params[:query], ip_adderss)
    render json: {status: 200, body: search_suggestions}
  end
end
