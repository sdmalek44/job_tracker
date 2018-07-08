require 'rails_helper'

describe 'features' do
  describe 'user visits /dashboard' do
    it 'can see a count of jobs by level of interest' do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "sports")
      company.jobs.create!(title: "Developer", level_of_interest: 1, city: "Denver", category_id: category.id)
      company.jobs.create!(title: "Developer", level_of_interest: 1, city: "Denver", category_id: category.id)
      company.jobs.create!(title: "Developer", level_of_interest: 2, city: "Denver", category_id: category.id)
      company.jobs.create!(title: "Developer", level_of_interest: 3, city: "Denver", category_id: category.id)
      company.jobs.create!(title: "Developer", level_of_interest: 4, city: "Denver", category_id: category.id)
      company.jobs.create!(title: "Developer", level_of_interest: 4, city: "Denver", category_id: category.id)
      company.jobs.create!(title: "Developer", level_of_interest: 4, city: "Denver", category_id: category.id)

      visit dashboard_path

      expect(page).to have_content("5 stars: 0 job(s)")
      expect(page).to have_content("4 stars: 3 job(s)")
      expect(page).to have_content("3 stars: 1 job(s)")
      expect(page).to have_content("2 stars: 1 jobs(s)")
      expect(page).to have_content("1 star: 2 jobs(s)")
    end
  end
end
