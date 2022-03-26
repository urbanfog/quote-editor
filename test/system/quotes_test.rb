require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    login_as users(:accountant)
    @quote = quotes(:first)
  end

  test "create a new quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "New Quote"
    fill_in "Name", with: "Capybara quote"
    click_on "Create quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated quote"

    assert_selector "h1", text: "Quotes"
    click_on "Update quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Destroy a quote" do
    visit quotes_path
    assert_text @quote.name

    within id: dom_id(@quote) do
      click_on "Delete"
    end
    
    assert_no_text @quote.name
  end
end
