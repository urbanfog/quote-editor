class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  broadcasts_to -> (quote) { [quote.company, "quotes"] }, inserts_by: :prepend

  belongs_to :company
  has_many :line_item_dates, dependent: :destroy
end
