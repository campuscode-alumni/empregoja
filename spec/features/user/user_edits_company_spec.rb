require 'rails_helper'

feature 'User edits a company' do
  scenario 'successfully' do
    company = Company.create(name:     'Campus Code',
                             location: 'São Paulo',
                             phone:    '2369-3476',
                             mail:     'contato@campuscode.com.br')

    visit edit_company_path(company)

    fill_in 'Name',     with: 'Code Campus'
    fill_in 'Location', with: 'Recife'
    fill_in 'Mail',     with: 'contat@codecampus.com.br'
    fill_in 'Phone',    with: '1111-5555'

    click_on 'Atualizar Empresa'

    expect(page).to have_content 'Code Campus'
    expect(page).to have_content 'Recife'
    expect(page).to have_content 'contat@codecampus.com.br'
    expect(page).to have_content '1111-5555'
  end
end
