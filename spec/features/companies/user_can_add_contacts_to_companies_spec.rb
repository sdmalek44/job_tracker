# require 'rails_helper'
#
# describe 'features' do
#   describe 'when visiting /companies/#' do
#     it 'can create a contact for a company' do
#       company = Company.create!(name: 'ESPN')
#       company.contacts.create!(name: 'Billy Bob', position: 'hiring manager', email: '@penelope.wooo.com')
#
#       visit company_path(company)
#
#       fill_in "contact[name]", with: ""
#       fill_in "contact[position]", with: "this job is terrible"
#       click_on "Create Contact"
#
#       expect(current_path).to eq(company_job_path(company, job))
#       expect(page).to have_content("joe shmo")
#       expect(page).to have_content("this job is terrible")
#     end
#   end
# end
