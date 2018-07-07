require 'rails_helper'

describe 'features' do
  describe 'when visiting /categories/new' do
    it 'user can create a new category' do
      visit categories_path

      click_on 'Create New Category'

      fill_in "category[title]", with: 'poop scoopery'
      click_on "Create Category"

      expect(current_path).to eq(category_path(1))
      expect(page).to have_content('poop scoopery')
    end

    it 'user cannot create a category that already exists' do
      category = Category.create(title: 'medicine')

      visit new_category_path

      fill_in "category[title]", with: 'medicine'
      click_on "Create Category"

      expect(current_path).to eq(new_category_path)
      expect(page).to have_content("'#{category.title}' category already exists")
    end
  end
end
