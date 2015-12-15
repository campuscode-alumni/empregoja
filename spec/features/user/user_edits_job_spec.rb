require 'rails_helper'

feature 'User creates a new job' do

  scenario 'successfully' do
    company = Company.create(name:    'Campus Code',
                            location: 'São Paulo',
                            mail:     'contato@campuscode.com.br',
                            phone:    '2369-3476')

    new_company = Company.create(name:     'Code Campus',
                                 location: 'Refice',
                                 mail:     'contato@codecampus.com.br',
                                 phone:    '1111-5555')

    category = Category.create(name: 'Desenvolvedor')

    new_category = Category.create(name: 'Dev Ninja')

    job = Job.create(title: 'Vaga de Dev',
               description: 'Dev Junior Rails com ao menos um projeto',
               location: 'São Paulo',
               company: company,
               category: category)

    visit edit_job_path(job)

    fill_in 'Title',       with: 'Dev Mais que Master'
    fill_in 'Location',    with: 'Recife'
    select  new_company.name
    select  new_category.name
    fill_in 'Description', with: 'Vaga para Dev Mais que Master para o Quickstart'

    click_on 'Atualizar Vaga'

    expect(page).to have_content 'Dev Mais que Master'
    expect(page).to have_content 'Recife'
    expect(page).to have_content 'Dev Ninja'
    expect(page).to have_content 'Code Campus'
    expect(page).to have_content 'Vaga para Dev Mais que Master para o Quickstart'
  end

  scenario 'featured job' do
    company = Company.create(name:     'Campus Code',
                            location: 'São Paulo',
                            mail:     'contato@campuscode.com.br',
                            phone:    '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.create(title: 'Vaga de Dev',
               description: 'Dev Junior Rails com ao menos um projeto',
               location:    'São Paulo',
               company:  company,
               category: category,
               featured:    false)

    visit edit_job_path(job)

    fill_in 'Title',       with: 'Dev Mais que Master'
    fill_in 'Location',    with: 'Recife'
    select  'Campus Code'
    select  'Desenvolvedor'
    fill_in 'Description', with: 'Vaga para Dev Mais que Master para o Quickstart'
    check   'Featured'

    click_on 'Atualizar Vaga'

    expect(page).to have_content 'Dev Mais que Master'
    expect(page).to have_content 'Recife'
    expect(page).to have_content 'Desenvolvedor'
    expect(page).to have_content 'Campus Code'
    expect(page).to have_content 'Vaga para Dev Mais que Master para o Quickstart'
    expect(page).to have_content 'Vaga em Destaque'
  end


end

