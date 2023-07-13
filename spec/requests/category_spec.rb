require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(name: 'John', email: 'john@example.com', password: 'password') }

  describe 'GET /categories' do
    it 'returns a successful response' do
      sign_in user

      get user_categories_path(user)

      expect(response).to have_http_status(:success)
    end
  end
end
