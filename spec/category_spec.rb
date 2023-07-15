require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    user = User.create!(name: 'John Doe', email: 'doe@gmail.com', password: '123456')
    category = Category.new(
      name: 'Chocolate Cake',
      icon: 'books.jpg',
      user_id: user.id
    )
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category = Category.new(name: nil)
    expect(category).to_not be_valid
    expect(category.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without an icon' do
    category = Category.new(icon: nil)
    expect(category).to_not be_valid
    expect(category.errors[:icon]).to include("can't be blank")
  end
end
