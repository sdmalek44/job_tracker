require 'rails_helper'

describe 'user visits /categories/#/edit' do
  it 'updates a catgegory' do
    category = Category.create!(title: 'Medicine')

    visit edit_category_path(category)

    fill_in :category_title, with: 'Janitorial'
    click_on 'Update Category'

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content('Category updated')
    expect(page).to have_content('Janitorial')
  end

  it 'clicking cancel takes user back to the categoires index' do
    category = Category.create(title: 'Medicine')

    visit edit_category_path(category)

    click_on 'Cancel'

    expect(current_path).to eq(categories_path)
  end
end
