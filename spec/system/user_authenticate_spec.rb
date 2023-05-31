require 'rails_helper'

describe 'Usuário se autentica' do
  it 'com sucesso e vê a página inicial' do
    User.create!(email: 'gustavoalberttodev@gmail.com', password: 'password')

    visit root_path
    click_on 'Login'

    fill_in 'Email', with: 'gustavoalberttodev@gmail.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'

    expect(current_path).to eq root_path
    expect(page).to have_content('Login efetuado com sucesso.')
    expect(page).to have_content('PetApp')
  end

  it 'com dados incompletos' do
    User.create!(email: 'gustavoalberttodev@gmail.com', password: 'password')

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: 'gustavoalberttodev@gmail.com'
    fill_in 'Senha', with: ''
    click_on 'Entrar'

    expect(current_path).to eq user_session_path
    expect(page).to have_content('E-mail ou senha inválidos.')
    expect(page).to have_content('PetApp')
  end

  it 'faz login e depois faz logout' do
    user = User.create!(email: 'gustavoalberttodev@gmail.com', password: 'password')

    login_as user
    visit root_path
    click_on 'Sair'

    expect(current_path).to eq root_path
    expect(page).to have_link('Login')
    expect(page).not_to have_button('Sair')
    expect(page).to have_content('Logout efetuado com sucesso.')
  end
end