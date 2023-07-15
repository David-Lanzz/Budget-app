class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :activities

  has_one_attached :icon # or has_many_attached if you want multiple icons

  validates :name, presence: true
  validates :icon, presence: true
end
