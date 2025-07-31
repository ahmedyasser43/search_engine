class SearchAnalyticsController < ApplicationController
    def index
      search_analytics_service = SearchAnalyticsService.new
      analytics = search_analytics_service.get_analytics
      render json: {status: 200, body: analytics}
    end
end
