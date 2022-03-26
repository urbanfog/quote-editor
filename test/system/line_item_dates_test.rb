require "application_system_test_case"

class LineItemDatesTest < ApplicationSystemTestCase
  include ActionView::Helpers::NumberHelper

  setup do
    login_as users(:accountant)
    @quote = quotes(:first)
    @line_item_date = line_item_dates(:today)

    visit quote_path(@quote)
  end

  test "Creating a new line item date" do
    assert_selector "h1", text: "First Quote"

    click_on "New Date"
    fill_in "Date", with: Date.current + 1.day
    click_on "Create date"

    assert_text I18n.l(Date.current + 1.day, format: :long)
  end

  test "Updating a line_item_date" do
    assert_selector "h1", text: "First Quote"

    within id: dom_id(@line_item_date, :edit) do
      click_on "Edit"
    end

    assert_selector "h1", text: "First Quote"
    fill_in "Date", with: Date.current + 1.day
    click_on "Update date"

    assert_text I18n.l(Date.current + 1.day, format: :long)
  end

  test "Destroying a line_item_date" do
    assert_text I18n.l(Date.current, format: :long)

    accept_confirm do
      within id: dom_id(@line_item_date, :edit) do
        click_on "Delete"
      end
    end

    assert_no_text I18n.l(Date.current, format: :long)
    assert_text number_to_currency(@quote.total_price)
  end
end
