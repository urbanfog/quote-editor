require "application_system_test_case"

class LineItemSystemTest < ApplicationSystemTestCase
  include ActionView::Helpers::NumberHelper

  setup do
    login_as users(:accountant)

    @quote = quotes(:first)
    @line_item_date = line_item_dates(:today)
    @line_item = line_items(:room_today)

    visit quote_path(@quote)
  end

  test "Creating a new line item" do
    assert_selector "h1", text: "First Quote"

    within "##{dom_id(@line_item_date)}" do
      click_on "Add Item", match: :first
    end

    assert_selector "h1", text: "First Quote"

    fill_in "Name", with: "Animation"
    fill_in "Quantity", with: 1
    fill_in "Unit Price", with: 100
    click_on "Create item"

    assert_selector "h1", text: "First Quote"
    assert_text "Animation"
    assert_text number_to_currency(100)
    assert_text number_to_currency(@quote.total_price)
  end

  test "Updating a line_item" do
    assert_selector "h1", text: "First Quote"

    within id: dom_id(@line_item) do
      click_on "Edit"
    end

    fill_in "Name", with: "Capybara"
    fill_in "Unit Price", with: 1234
    click_on "Update item"
    
    assert_text "Capybara"
    assert_text number_to_currency(1234)
    assert_text number_to_currency(@quote.total_price)
  end

  test "Destroying a line_item" do
    within id: dom_id(@line_item_date) do
      assert_text @line_item.name
    end

    within id: dom_id(@line_item) do
      click_on "Delete"
    end

    within id: dom_id(@line_item_date) do
      assert_no_text @line_item.name
    end
    
    assert_text number_to_currency(@quote.total_price)
  end
end
