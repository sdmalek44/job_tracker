require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
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

      expect(Company.top_three_by_average_interest)
    end
  end
end
