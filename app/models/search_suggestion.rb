class SearchSuggestion < ApplicationRecord

    def update_search_count
        self.update(count: self.count + 1)
    end
end
