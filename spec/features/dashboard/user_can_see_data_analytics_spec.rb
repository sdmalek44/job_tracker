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

      expect(page).to have_content("4 star(s): 3 job(s)")
      expect(page).to have_content("3 star(s): 1 job(s)")
      expect(page).to have_content("2 star(s): 1 job(s)")
      expect(page).to have_content("1 star(s): 2 job(s)")
      expect(page).to_not have_content("5 star(s)")
    end
    xit 'can see the top 3 companies ranked by average level of interest' do
      company1 = Company.create!(name: "ESPN")
      category = Category.create!(title: "sports")
      company1.jobs.create!(title: "Developer", level_of_interest: 1, city: "Denver", category_id: category.id)
      company1.jobs.create!(title: "Janitor", level_of_interest: 3, city: "Denver", category_id: category.id)
      company2 = Company.create!(name: "Best Buy")
      company2.jobs.create!(title: "Waiter", level_of_interest: 2, city: "Denver", category_id: category.id)
      company2.jobs.create!(title: "Cop", level_of_interest: 4, city: "Denver", category_id: category.id)
      company3 = Company.create!(name: "Target")
      company3.jobs.create!(title: "Carpenter", level_of_interest: 3, city: "Denver", category_id: category.id)
      company3.jobs.create!(title: "Developer", level_of_interest: 5, city: "Denver", category_id: category.id)
      company4 = Company.create!(name: "Taco Bell")
      company4.jobs.create!(title: "Manager", level_of_interest: 1, city: "Denver", category_id: category.id)
      company4.jobs.create!(title: "Fireman", level_of_interest: 1, city: "Denver", category_id: category.id)

      visit dashboard_path

      expect(page).to have_content("#{company1.name} (2.0 stars)")
      expect(page).to have_content("#{company2.name} (3.0 stars)")
      expect(page).to have_content("#{company3.name} (4.0 stars)")
      expect(page).to_not have_content(company4.name)
    end

    it 'can see list of cities with number of jobs in those cities' do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "sports")
      company_1 = company.jobs.create!(title: "Developer", level_of_interest: 1, city: "Denver", category_id: category.id)
      company_2 = company.jobs.create!(title: "Developer", level_of_interest: 1, city: "Denver", category_id: category.id)
      company_3 = company.jobs.create!(title: "Developer", level_of_interest: 2, city: "Denver", category_id: category.id)
      company_4 = company.jobs.create!(title: "Developer", level_of_interest: 3, city: "Chicago", category_id: category.id)
      company_5 = company.jobs.create!(title: "Developer", level_of_interest: 4, city: "Chicago", category_id: category.id)
      company_6 = company.jobs.create!(title: "Developer", level_of_interest: 4, city: "Portland", category_id: category.id)
      company_7 = company.jobs.create!(title: "Developer", level_of_interest: 4, city: "Los Angeles", category_id: category.id)

      visit dashboard_path

      expect(page).to have_content("Denver jobs (3 jobs)")
      expect(page).to have_content("Chicago jobs (2 jobs)")
      expect(page).to have_content("Portland jobs (1 jobs)")
      expect(page).to have_content("Los Angeles jobs (1 jobs)")
    end
  end
end
