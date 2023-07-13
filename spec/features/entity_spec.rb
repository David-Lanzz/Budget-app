require 'rails_helper'

RSpec.describe 'Entities', type: :feature do
  let(:user) { User.create!(name: 'Lanzz', email: 'lanzz2@gmail.com', password: '123456') }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  describe 'Index page' do
    let(:category) do
      Category.create!(
        id: 517,
        name: 'Chocolate Cake',
        icon: 'books.jpg',
        user_id: user.id
      )
    end

    let!(:entity1) do
      Entity.create!(
        name: 'My entity',
        amount: 300,
        user_id: user.id,
        category:
      )
    end

    let!(:entity2) do
      Entity.create!(
        name: 'Our entity',
        amount: 400,
        user_id: user.id,
        category:
      )
    end

    it 'displays a list of entities' do
      visit user_category_path(user_id: user.id, id: category.id)

      expect(page).to have_content(entity1.name)
      expect(page).to have_content(entity2.name)
      expect(page).to have_content(entity2.amount)
    end
  end
end
