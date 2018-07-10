require 'rails_helper'

describe 'feature' do
  describe 'when user visits /categories' do
    it 'user can see all categories' do
      category_1 = Category.create(title: 'poop scoopery')
      category_2 = Category.create(title: 'medicine')

      visit categories_path

      expect(page).to have_content("#{category_1.title}")
      expect(page).to have_content("#{category_2.title}")
    end

    it 'user can visit page to add a new category' do
      visit categories_path

      click_on "Add New Category"

      expect(current_path).to eq(new_category_path)
    end

    it 'user can visit a page to edit a category' do
      category = Category.create!(title: 'Medicine')

      visit categories_path

      click_on 'Edit'

      expect(current_path).to eq(edit_category_path(category))
    end

    it 'user can delete a category' do
      category = Category.create!(title: 'Medicine')

      visit categories_path

      click_on 'Delete'

      expect(current_path).to eq(categories_path)
      expect(page).to_not have_content(category.title)
    end

    it 'user can see job counts by category and view those jobs' do
      company = Company.create!(name: 'sanitation plus')
      category = Category.create!(title: 'poop scoopery')
      job_1 = company.jobs.create!(title: "sanitation expert", level_of_interest: 70, city: "Denver", category_id: category.id)
      job_2 = company.jobs.create!(title: "pro scooper", level_of_interest: 69, city: "San Diego", category_id: category.id)

      visit categories_path

      expect(page).to have_content('2 jobs')

      click_on('2 jobs')

      expect(current_path).to eq(category_path(category))
    end
  end
end
