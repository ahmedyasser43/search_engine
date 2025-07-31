require "application_system_test_case"

class SearchSuggestionsTest < ApplicationSystemTestCase
  setup do
    @search_suggestion = search_suggestions(:one)
  end

  test "visiting the index" do
    visit search_suggestions_url
    assert_selector "h1", text: "Search suggestions"
  end

  test "should create search suggestion" do
    visit search_suggestions_url
    click_on "New search suggestion"

    fill_in "Count", with: @search_suggestion.count
    fill_in "Term", with: @search_suggestion.term
    click_on "Create Search suggestion"

    assert_text "Search suggestion was successfully created"
    click_on "Back"
  end

  test "should update Search suggestion" do
    visit search_suggestion_url(@search_suggestion)
    click_on "Edit this search suggestion", match: :first

    fill_in "Count", with: @search_suggestion.count
    fill_in "Term", with: @search_suggestion.term
    click_on "Update Search suggestion"

    assert_text "Search suggestion was successfully updated"
    click_on "Back"
  end

  test "should destroy Search suggestion" do
    visit search_suggestion_url(@search_suggestion)
    click_on "Destroy this search suggestion", match: :first

    assert_text "Search suggestion was successfully destroyed"
  end
end
