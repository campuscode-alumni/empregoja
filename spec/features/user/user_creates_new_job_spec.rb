require 'rails_helper'

feature 'User creates a new job' do
  scenario 'successfully' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.new(title: 'Dev Master',
                  location: 'Rio de Janeiro',
                  category: category,
                  description: 'Vaga para Dev Master para Bootcamp Rails')

    visit new_job_path

    fill_in 'Title',       with: job.title
    fill_in 'Location',    with: job.location
    select category.name,  from: 'Category'
    select company.name,   from: 'Company'
    fill_in 'Description', with: job.description

    click_on 'Criar Vaga'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.category.name
    expect(page).to have_content company.name
    expect(page).to have_content job.description
  end

  scenario 'featured job' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.new(title:    'Dev Master',
                  location: 'Rio de Janeiro',
                  category: category,
                  description: 'Vaga para Dev Master para o Bootcamp Rails')
    visit new_job_path
    fill_in 'Title',       with: job.title
    fill_in 'Location',    with: job.location
    select category.name,  from: 'Category'
    select company.name,   from: 'Company'
    fill_in 'Description', with: job.description
    check 'Featured'

    click_on 'Criar Vaga'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.category.name
    expect(page).to have_content company.name
    expect(page).to have_content job.description
    expect(page).to have_content 'Vaga em Destaque'
  end

  scenario 'invalid data' do
    visit new_job_path

    click_on 'Criar Vaga'

    %w(Title Category Description Location).each do |field|
      expect(page).to have_content "#{field} can\'t be blank"
    end
  end
end
