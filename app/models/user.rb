class User < ApplicationRecord
  has_many :categories
  has_many :entities
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
end
