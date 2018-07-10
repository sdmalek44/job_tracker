require 'rails_helper'

describe 'features' do
  describe 'when a user visits /companies/#' do
    it  'can delete a contact' do
      company = Company.create!(name: 'ESPN')
      contact = company.contacts.create!(name: 'bobby', position: 'newscaster', email: 'dkflkj@yahoozle.com')

      visit company_path(company)

      expect(page).to have_content(contact.name)

      click_on "Delete Contact"

      expect(current_path).to eq(company_path(company))
      expect(page).to_not have_content(contact.name)
    end
  end
end
