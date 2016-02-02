require 'rails_helper'

feature 'Visitor should see expired job' do
  scenario 'unsuccessfully' do
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


    travel_to 90.days.from_now do

      visit root_path

      expect(page).not_to have_content "Vaga de Dev"

    end
  end

  scenario 'by direct link' do
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


    travel_to 90.days.from_now do

      visit job_path(job.id)

      expect(page).to have_content "Vaga Expirada"

    end
  end
end
