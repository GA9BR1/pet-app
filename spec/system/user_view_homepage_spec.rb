require 'rails_helper'

describe 'usuário visita a homepage' do
  it 'e vê o nome da app' do
    visit root_path

    expect(page).to have_content 'PetApp'
  end
end