require 'rails_helper'

feature 'Visitor choose jobs by company' do
  scenario 'successfully' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campuscode.com.br',
                             phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.create(title:       'Vaga de Dev',
                     category:    category,
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location:    'São Paulo',
                     company:  company)
    visit root_path

    click_on company.name

    expect(page).to have_content company.name
    expect(page).to have_content job.title
    expect(page).to have_content job.category.name
    expect(page).to have_content job.description
    expect(page).to have_content job.location
  end

  scenario 'and does not see other company jobs' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campuscode.com.br',
                             phone:    '2369-3476')

    company_2 = Company.create(name:     'Another Company',
                               location: 'Another City',
                               mail:     'contato@company.com.br',
                               phone:    '1111-2222')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.create(title:       'Vaga de Dev',
                     category:    category,
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location:    'São Paulo',
                     company:  company)

    visit root_path

    click_on company_2.name

    expect(page).to have_content company_2.name
    expect(page).not_to have_content job.title
    expect(page).not_to have_content job.category.name
    expect(page).not_to have_content job.description
    expect(page).not_to have_content job.location
  end
end
