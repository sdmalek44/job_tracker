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

  describe 'dependent destory' do
    it 'should delete all associated comments when destroyed' do
      company = Company.create!(name: 'ESPN')
      category = Category.create!(title: 'sports')
      job = company.jobs.create!(title: 'Developer', level_of_interest: 1, city: 'Denver', category_id: category.id)
      job.comments.create(author: 'Joe', body: 'Hello')
      job.comments.create(author: 'Bob', body: 'Goodbye')

      expect(Comment.count).to eq(2)

      job.destroy

      expect(Comment.count).to eq(0)
    end
  end

  describe 'class methods' do
    it 'can count jobs by level of interest' do
      company = Company.create!(name: 'ESPN')
      category = Category.create!(title: 'sports')
      company.jobs.create!(title: 'Developer', level_of_interest: 1, city: 'Denver', category_id: category.id)
      company.jobs.create!(title: 'Developer', level_of_interest: 1, city: 'Denver', category_id: category.id)
      company.jobs.create!(title: 'Developer', level_of_interest: 2, city: 'Denver', category_id: category.id)
      company.jobs.create!(title: 'Developer', level_of_interest: 3, city: 'Denver', category_id: category.id)
      company.jobs.create!(title: 'Developer', level_of_interest: 4, city: 'Denver', category_id: category.id)
      company.jobs.create!(title: 'Developer', level_of_interest: 4, city: 'Denver', category_id: category.id)
      company.jobs.create!(title: 'Developer', level_of_interest: 4, city: 'Denver', category_id: category.id)

      expect(Job.count_levels_of_interest).to eq({4=>3, 3=>1, 2=>1, 1=>2})
    end

    it 'self.jobs_by_city' do
      company = Company.create!(name: 'ESPN')
      category = Category.create!(title: 'sports')
      company.jobs.create!(title: 'Developer', level_of_interest: 1, city: 'Denver', category_id: category.id)
      company.jobs.create!(title: 'Developer', level_of_interest: 1, city: 'Denver', category_id: category.id)
      company.jobs.create!(title: 'Developer', level_of_interest: 2, city: 'Chicago', category_id: category.id)
      company.jobs.create!(title: 'Developer', level_of_interest: 3, city: 'Chicago', category_id: category.id)
      company.jobs.create!(title: 'Developer', level_of_interest: 4, city: 'Portland', category_id: category.id)

      expect(Job.jobs_by_city).to eq({'Denver' => 2, 'Chicago' => 2, 'Portland' => 1})
    end
  end
end
