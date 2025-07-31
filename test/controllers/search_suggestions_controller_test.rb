require "test_helper"

class SearchSuggestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @search_suggestion = search_suggestions(:one)
  end

  test "should get index" do
    get search_suggestions_url
    assert_response :success
  end

  test "should get new" do
    get new_search_suggestion_url
    assert_response :success
  end

  test "should create search_suggestion" do
    assert_difference("SearchSuggestion.count") do
      post search_suggestions_url, params: { search_suggestion: { count: @search_suggestion.count, term: @search_suggestion.term } }
    end

    assert_redirected_to search_suggestion_url(SearchSuggestion.last)
  end

  test "should show search_suggestion" do
    get search_suggestion_url(@search_suggestion)
    assert_response :success
  end

  test "should get edit" do
    get edit_search_suggestion_url(@search_suggestion)
    assert_response :success
  end

  test "should update search_suggestion" do
    patch search_suggestion_url(@search_suggestion), params: { search_suggestion: { count: @search_suggestion.count, term: @search_suggestion.term } }
    assert_redirected_to search_suggestion_url(@search_suggestion)
  end

  test "should destroy search_suggestion" do
    assert_difference("SearchSuggestion.count", -1) do
      delete search_suggestion_url(@search_suggestion)
    end

    assert_redirected_to search_suggestions_url
  end
end
