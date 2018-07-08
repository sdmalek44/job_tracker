require 'rails_helper'

describe Company do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_uniqueness_of :name}
  end

  describe "relationships" do
    it {should have_many :jobs}
    it {should have_many :contacts}
    it 'should destroy jobs associated with company when company destroyed' do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "sports")
      company.jobs.create!(title: "Developer", level_of_interest: 1, city: "Denver", category_id: category.id)
      company.jobs.create!(title: "Janitor", level_of_interest: 3, city: "Denver", category_id: category.id)

      expect(Job.count).to eq(2)

      company.destroy

      expect(Job.count).to eq(0)
    end
  end

  describe 'class methods' do
    it 'self.top_three_by_average_interest' do
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

      expect(Company.top_three_by_average_interest).to eq([company3, company2, company1])
    end
  end
end
