require 'rails_helper'

describe 'usuário visita a homepage' do
  it 'e vê o nome da app' do
    #Arrange

    #Act
    visit root_path

    #Assert
    expect(page).to have_content 'PetApp'
  end

end