require 'rails_helper'

describe 'user visits /categories' do
  it 'user can delete a category' do
    category = Category.create!(title: 'Medicine')

    visit categories_path

    click_on 'Delete'

    expect(current_path).to eq(categories_path)
    expect(page).to_not have_content(category.title)
  end
end
