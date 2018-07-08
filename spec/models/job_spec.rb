require 'rails_helper'

describe Job, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:title)}
    it{should validate_presence_of(:level_of_interest)}
    it{should validate_presence_of(:city)}
  end

  describe 'relationships' do
    it{should belong_to(:company)}
    it{should belong_to(:category)}
    it{should have_many(:comments)}
  end

  describe 'class methods' do
    it 'can count jobs by level of interest' do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: "sports")
      company.jobs.create!(title: "Developer", level_of_interest: 1, city: "Denver", category_id: category.id)
      company.jobs.create!(title: "Developer", level_of_interest: 1, city: "Denver", category_id: category.id)
      company.jobs.create!(title: "Developer", level_of_interest: 2, city: "Denver", category_id: category.id)
      company.jobs.create!(title: "Developer", level_of_interest: 3, city: "Denver", category_id: category.id)
      company.jobs.create!(title: "Developer", level_of_interest: 4, city: "Denver", category_id: category.id)
      company.jobs.create!(title: "Developer", level_of_interest: 4, city: "Denver", category_id: category.id)
      company.jobs.create!(title: "Developer", level_of_interest: 4, city: "Denver", category_id: category.id)

      expect(Job.count_levels_of_interest).to eq({4=>3, 3=>1, 2=>1, 1=>2})
    end
  end
end
