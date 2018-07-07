require 'rails_helper'

describe 'features' do
  describe 'when visiting /categories/new' do
    it 'user can create a new category' do
      visit new_category_path

      fill_in "category[title]", with: 'poop scoopery'
      click_on "Create Category"

      expect(current_path).to eq(categories_path)

      expect(page).to have_content('poop scoopery')
    end
  end
end
