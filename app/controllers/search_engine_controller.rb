class SearchEngineController < ApplicationController
    def search
      user_ip = request.remote_ip
      search_suggestions_serivce = SearchSuggestionsService.new
      search_suggestions_serivce.search(params, user_ip)
      render json: {status: 200}
    end
end
