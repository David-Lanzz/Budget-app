class Category < ApplicationRecord
  belongs_to :user
  has_many :entities

  def total_price
    entities.sum(:amount)
  end

  validates :name, presence: true
  validates :icon, presence: true
end
