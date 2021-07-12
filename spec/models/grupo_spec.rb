require 'rails_helper'

RSpec.describe Grupo, type: :model do
  it 'É valido quando não existe caracteres especiais' do
    grupo = Grupo.new( nome: 'Teste de criação de grupo á ?<> #' ) 
    grupo.valid?   
    expect(grupo.errors[:nome]).to include("Nâo pode conter caracteres especiais") 
  end
  it 'É valido quando contém menos de 51 caracteres' do
    grupo = Grupo.new( nome: 'Grupo de tarefas criadas para o teste, Grupo de tarefas criadas para o teste ,  Grupo de tarefas criadas para o teste , Grupo de tarefas criadas para o teste' ) 
      expect(grupo).to be_valid 
  end
  it 'É valido quando o nome não é nula' do
    grupo = Grupo.new( nome: nil ) 
    grupo.valid?   
    expect(grupo.errors[:nome]).to include("Nâo pode vir em branco") 
  
  end



  let(:grupo) { Grupo.new(nome: 'TESTE 1') }
  before { grupo.save }

  context 'É valido quando o valor é único' do
    let(:grupo1) { Grupo.new(nome: 'TESTE 2') }

    it { expect(grupo1).to be_valid }
  end

  context 'É valido quando o valor é único' do
    let(:user1) { Grupo.new(nome: 'TESTE 1') }

    it { expect(grupo1).to_not be_valid }
  end



end
