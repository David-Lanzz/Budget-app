require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  let(:user) { User.create!(name: 'Lanzz', email: 'lanzz2@gmail.com', password: '123456') }
  let(:category1) do
    Category.create!(
      name: 'Chocolate Cake',
      icon: 'books.jpg',
      user_id: user.id
    )
  end

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
  describe 'Index page' do
    it 'displays a list of categories' do
      visit user_categories_path(category1)

      expect(page).to have_content('Category')
      expect(page).to have_content(category1.name)
    end
  end
end
