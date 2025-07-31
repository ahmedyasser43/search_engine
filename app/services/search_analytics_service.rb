class SearchAnalyticsService

    def get_top_5_searches
        top_searches = SearchSuggestion.order(count: :desc).limit 5
    end

    def get_analytics_count_by_time_range
        logs_count_per_hour = SearchLog.group("EXTRACT(HOUR FROM created_at)").count
        # Convert float hour keys to integer hour keys
        logs_count_per_hour = logs_count_per_hour.transform_keys { |k| k.to_i }


        hours = (0..23).to_a
        hourly_counts = hours.each_with_object({}) do |hour, hash|
            count = logs_count_per_hour[hour.to_s] || logs_count_per_hour[hour] || 0
            hash[hour] = count
        end

        hourly_counts

    end

    def get_analytics_terms_by_time_range
        logs = SearchLog
            .select("term, EXTRACT(HOUR FROM created_at) AS hour")
            .group("hour, term")
            .order("hour")

        logs = logs.to_a.map { |log| log.hour = log.hour.to_i; log }

        hours = (0..23).to_a
        hourly_terms = hours.each_with_object({}) do |hour, hash|
            hash[hour] = []
        end

        logs.each do |log|
            p "#{log.term}"
            p "#{log.hour}"
            p "#{hourly_terms}"
            hourly_terms[log.hour.to_i] << log.term
        end

        hourly_terms
    end

    def get_analytics_by_region
        logs = SearchLog.group(:region).count
    end

    def get_analytics
        top_searches = get_top_5_searches
        analytics_counts_by_time_range = get_analytics_count_by_time_range
        terms_analytics_by_time_range = get_analytics_terms_by_time_range
        analytics_by_region = get_analytics_by_region

        results = {
            top_searches: top_searches,
            analytics_counts_by_time_range: analytics_counts_by_time_range,
            terms_analytics_by_time_range: terms_analytics_by_time_range,
            analytics_by_region: analytics_by_region
        }
    end
end