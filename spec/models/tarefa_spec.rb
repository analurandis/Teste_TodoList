require 'rails_helper'

RSpec.describe Tarefa, type: :model do
  it 'É valido quando não existe caracteres especiais' do
    tarefa = Tarefa.new( descricao: 'Teste de criação de tarefa á ?<> #' ) 
    tarefa.valid?   
    expect(tarefa.errors[:descricao]).to include("Descrição da tarefa não pode conter caracteres especiais") 
  end
  it "É valido quando contém menos de 201 caracteres" do
    tarefa.descricao = 'a' * 201
    expect(tarefa).not_to be_valid
  end
  it "É valido quando contém menos de 201 caracteres" do
    tarefa.descricao = 'a' * 100
    expect(tarefa).to be_valid
  end
  it 'É valido quando contém menos de 201 caracteres' do
    tarefa = Tarefa.new( descricao: 'Teste de criação de  Teste de criação de taref Teste de criação de tarefa Teste de criação de tarefa Teste de criação de taref Teste de criação de tarefTeste de criação de taref Teste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tarefTeste de criação de tareftarefa' ) 
      expect(tarefa).to  be_valid 
  end
  it 'É valido quando a descrição não é nula' do
    tarefa = Tarefa.new( descricao: nil ) 
    tarefa.valid?   
    expect(tarefa.errors[:descricao]).to include("Nâo pode vir em branco") 
  end

  let(:user) { User.new(email: 'foo@bar.com', username: 'foo') }
  before { user.save }

  context 'username uniqueness' do
    let(:user1) { User.new(email: 'bar@foo.com', username: 'foo') }

    it { expect(user1).to_not be_valid }
  end

  context 'email uniqueness' do
    let(:user1) { User.new(email: 'foo@bar.com', username: 'bar') }

    it { expect(user1).to_not be_valid }
  end

 
end
