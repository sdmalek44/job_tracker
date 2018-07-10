require 'rails_helper'

describe 'features' do
  describe 'when visiting /companies/#/jobs/#' do
    it 'can see a list of comments for job' do
      company = Company.create!(name: 'ESPN')
      category = Category.create!(title: 'sports')
      job = company.jobs.create!(title: 'manager', level_of_interest: 10, city: 'Denver', category_id: category.id)
      comment1 = job.comments.create!(author: 'bobby bagadonats', body: 'you suck at your job. we lost every game')
      comment2 = job.comments.create!(author: 'billy bobabaguts', body: 'that was a great season coach')

      visit job_path(job)

      expect(page).to have_content(comment1.author)
      expect(page).to have_content(comment1.body)
      expect(page).to have_content(comment2.author)
      expect(page).to have_content(comment2.body)
    end
  end
end
