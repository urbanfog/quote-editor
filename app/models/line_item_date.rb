class LineItemDate < ApplicationRecord
  belongs_to :quote
  has_many :line_items, dependent: :destroy
  
  validates :date, presence: true, uniqueness: { scope: :quote_id }

  scope :ordered, -> { order(date: :asc) }

  # Returns the previous line_item_date based on date of current line_item_date. Used in views/line_item_dates/edit.html.erb
  def previous_date
    quote.line_item_dates.ordered.where('date < ?', date).last
  end
end
