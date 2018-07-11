require 'rails_helper'

describe 'when visiting /categories/new' do
  it 'user can create a new category' do
    visit categories_path

    click_on 'Add New Category'

    fill_in :category_title, with: 'poop scoopery'
    click_on 'Create Category'

    expect(current_path).to eq(category_path(1))
    expect(page).to have_content('poop scoopery')
  end

  it 'user cannot create a category that already exists' do
    category = Category.create(title: 'medicine')

    visit new_category_path

    fill_in :category_title, with: 'medicine'
    click_on 'Create Category'

    expect(current_path).to eq(new_category_path)
    expect(page).to have_content('Sorry, the medicine category already exists')
  end

  it 'clicking cancel takes user back to the categoires index' do
    visit new_category_path

    click_on 'Cancel'

    expect(current_path).to eq(categories_path)
  end
end
