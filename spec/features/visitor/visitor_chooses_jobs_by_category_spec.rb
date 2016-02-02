require 'rails_helper'

feature 'Visitor chooses jobs by category' do
  scenario 'successfully' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campuscode.com.br',
                             phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.create(title: 'Vaga de Dev',
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location: 'São Paulo',
                     company: company,
                     category: category)

    job_2 = Job.create(title: 'Vaga de Dev',
                       description: 'Dev Junior Rails com ao menos um projeto',
                       location: 'São Paulo',
                       company: company,
                       category: category)
    visit root_path

    click_on category.name

    expect(page).to have_content category.name

    expect(page).to have_content job.title
    expect(page).to have_content job.category.name
    expect(page).to have_content job.description
    expect(page).to have_content job.location

    expect(page).to have_content job_2.title
    expect(page).to have_content job_2.category.name
    expect(page).to have_content job_2.description
    expect(page).to have_content job_2.location
  end

  scenario 'and does not see other category jobs' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             mail:     'contato@campuscode.com.br',
                             phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    category_2 = Category.create(name: 'Designer')

    job = Job.create(title: 'Vaga de Dev',
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location: 'São Paulo',
                     company: company,
                     category: category)

    visit root_path

    click_on category_2.name

    expect(page).to have_content category_2.name

    expect(page).not_to have_content job.title
    expect(page).not_to have_content job.category.name
    expect(page).not_to have_content job.description
    expect(page).not_to have_content job.location
  end
end
