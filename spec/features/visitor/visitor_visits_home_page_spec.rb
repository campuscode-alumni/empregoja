require 'rails_helper'

feature 'Visitor visits Emprego Ja home page' do
  scenario 'successfully' do
    visit root_path
    expect(page).to have_content('Emprego Já')
  end
  scenario 'and see jobs' do
    company = Company.create(name: 'Campus Code',
                            location: 'São Paulo',
                            mail: 'contato@campus.com.br',
                            phone: '2369-3476')
    Job.create(title: 'Vaga de Dev',
               category: 'Desenvolvedor',
               description: 'Dev Junior Rails com ao menos um projeto',
               company: company,
               location: 'São Paulo')
    Job.create(title: 'Vaga de QA',
               category: 'QA',
               company: company,
               description: 'QA Junior com ao menos um projeto',
               location: 'São Paulo')
    visit root_path
    expect(page).to have_content('Vaga de Dev')
    expect(page).to have_content('Campus Code')
    expect(page).to have_content('São Paulo')
    expect(page).to have_content('Vaga de QA')
  end
end
