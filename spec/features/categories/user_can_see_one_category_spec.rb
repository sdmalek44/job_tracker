require 'rails_helper'

describe 'features' do
  describe 'when user visits /categories/# they' do
    it 'can see a specific category' do
      category = Category.create!(title: 'poop scoopery')

      visit category_path(category)

      expect(page).to have_content(category.title)
    end
    it 'can see all jobs associated with category' do
      company = Company.create!(name: 'sanitation plus')
      category = Category.create!(title: 'poop scoopery')
      job_1 = company.jobs.create!(title: "sanitation expert", level_of_interest: 70, city: "Denver", category_id: category.id)
      job_2 = company.jobs.create!(title: "pro scooper", level_of_interest: 69, city: "San Diego", category_id: category.id)

      visit category_path(category)

      expect(page).to have_content(job_1.title)
      expect(page).to have_content(job_2.title)    
    end
  end
end
