class SearchSuggestionsService

    def get_initial_matching(ip_adderss)
        #fetch the popular searches in user region
        region = Geocoder.search("41.239.125.92").first&.country
        logs_suggestion_ids = SearchLog.where(
            region: region
        ).order(count: :desc).pluck(:search_suggestion_id)
        suggestions = SearchSuggestion.find(logs_suggestion_ids)
            .pluck(:id, :term, :count)
            .map { |id, term, count| { id: id, term: term, count: count } }
        suggestions
    end

    def get_matching_suggestions(query, ip_adderss=nil)
        if query.present?
            suggestions_list = SearchSuggestion.where("term ILIKE ?", "%#{query}%")
                .order(count: :desc)
                .limit(5)
                .pluck(:term, :id)
                .map { |term, id| { term: term, id: id } }
        else
            get_initial_matching(ip_adderss)
        end
    end

    def search(params, user_ip)
        #In case the user selects one of the returned suggestions
        if params[:id].present?
            p "#{params[:id]}"
            search_suggestion = SearchSuggestion.find(params[:id])
            search_suggestion.update_search_count
        else
            #check if the query th user searched matches one of the
            #search terms update the count
            search_suggestion = SearchSuggestion.where(term: params[:query]).limit(1).first
            if search_suggestion.present?
                search_suggestion.update_search_count
            else
                #if the user query is unmatched create a new one
                SearchSuggestion.create!(
                    term: params[:query],
                    count: 1
                )
            end
        end

        add_search_log(search_suggestion, user_ip)
    end

    def add_search_log(search_suggestion, ip_address)
        #TODO replace this ip with ip_adderss
        region = Geocoder.search("41.239.125.92").first&.country
        SearchLog.create!(
            ip_address: "41.239.125.92",
            term: search_suggestion.term,
            region: region,
            count: search_suggestion.count,
            search_suggestion: search_suggestion
        )
    end
end
