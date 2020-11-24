class Cart < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :order
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  def sub_total
    sum = 0
    line_items.each do |line_item|
      sum += line_item.total_price
    end
    sum
  end
end
