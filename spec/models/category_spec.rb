require 'rails_helper'

describe Category, type: :model do
  describe 'validations' do
    it{should validate_presence_of :title}
  end

  describe 'relationships' do
    it{should have_many :jobs}
  end

  describe 'dependent destroy' do
    it 'deletes jobs associated with deleted category' do
      company = Company.create!(name: 'ESPN')
      category = Category.create!(title: 'sports')
      company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category_id: category.id)
      company.jobs.create!(title: 'QA Analyst', level_of_interest: 70, city: 'New York City', category_id: category.id)

      expect(Job.count).to eq(2)

      category.destroy

      expect(Job.count).to eq(0)
    end
  end
end
