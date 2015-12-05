require 'rails_helper'

feature 'User creates a new job' do
  scenario 'successfully' do
    visit new_job_path

    job = Job.new(title: 'Dev Master',
                  location: 'Rio de Janeiro',
                  category: 'Desenvolvedor',
                  company: 'Campus Code',
                  description: 'Vaga para Dev Master para Bootcamp Rails')

    fill_in 'Title',       with: job.title
    fill_in 'Location',    with: job.location
    fill_in 'Category',    with: job.category
    fill_in 'Company',     with: job.company
    fill_in 'Description', with: job.description

    click_on 'Criar Vaga'

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.category
    expect(page).to have_content job.company
    expect(page).to have_content job.description
  end
end
