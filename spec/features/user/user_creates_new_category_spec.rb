require 'rails_helper'

feature 'User creates a new category' do
  scenario 'successfully' do
    category = Category.new(name: 'Desenvolvedor')

    visit new_category_path

    fill_in 'Name', with: category.name
    click_on 'Criar Categoria'

    expect(page).to have_content category.name
  end

  scenario 'invalid' do
    visit new_category_path
    click_on 'Criar Categoria'

    expect(page).to have_content 'Warning! All fields are mandatory.'
  end
end
