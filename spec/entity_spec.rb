require 'rails_helper'

RSpec.describe Entity, type: :model do
  it 'is valid with valid attributes' do
    user = User.create!(name: 'John Doe', email: 'doe@gmail.com', password: '123456')
    category = Category.new(
      id: 517,
      name: 'Chocolate Cake',
      icon: 'books.jpg',
      user_id: user.id
    )
    entity = Entity.new(
      name: 'my entity',
      amount: 300,
      user_id: user.id,
      category:
    )
    expect(entity).to be_valid
  end

  it 'is invalid without a name' do
    entity = Entity.new(name: nil)
    expect(entity).to_not be_valid
    expect(entity.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without an amount' do
    entity = Entity.new(amount: nil)
    expect(entity).to_not be_valid
    expect(entity.errors[:amount]).to include("can't be blank")
  end
end
