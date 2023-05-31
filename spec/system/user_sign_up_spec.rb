require 'rails_helper'

describe 'Usuário cria conta' do
  it 'com sucesso' do 
    visit root_path
    click_on 'Login'
    click_on 'Criar Conta'
    fill_in 'Nome', with: 'Nome'
    fill_in 'E-mail', with: 'email@example.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Cadastrar'

    expect(current_path).to eq root_path
    expect(page).to have_content('Boas vindas! Você realizou seu registro com sucesso.')
    expect(page).to have_content('PetApp')
  end
end