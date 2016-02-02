require 'rails_helper'

feature 'Visitor visits job details' do
  scenario 'successfully' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.create(title: 'Vaga de Dev',
                     category: category,
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location: 'São Paulo',
                     company: company)

    visit root_path

    click_on 'Ver mais'

    expect(page).to have_content job.title
    expect(page).to have_content job.category.name
    expect(page).to have_content company.name
    expect(page).to have_content job.description
    expect(page).to have_content job.location
  end
end
