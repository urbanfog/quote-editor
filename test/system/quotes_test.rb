require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  test "create a new quote" do
    # When we visit quotes#index page
    # we expect to see a title with the text "Quotes"
    visit "/quotes"
    assert_selector "h1", text: "Quotes"

    # When we click on the "New Quote" button
    # we expect to land on a page with a title "New Quote"
    click_on "New Quote"
    assert_selector "h1", text: "New Quote"

    # When we fill in the name input with "Capybara quote"
    # and we click "Create Quote"
    fill_in "Name", with: "Capybara quote"
    click_on "Create Quote"

    # We expect to be back on the page with the title "Quotes"
    # and to see our "Capybara quote" added to the list
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
    assert_selector "h1", text: "Edit Quote"

    fill_in "Name", with: "Updated quote"
    click_on "Update Quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated Quote"
  end

  test "Destroy a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
