require 'rails_helper'

describe 'features' do
  describe 'user visits /categories/#/edit' do
    it 'updates a catgegory' do
      category = Category.create!(title: 'Medicine')

      visit edit_category_path(category)
      
      fill_in :category_title, with: 'Janitorial'
      click_on 'Update Category'

      expect(current_path).to eq(category_path(category))
      expect(page).to have_content('Janitorial')
    end
  end
end
