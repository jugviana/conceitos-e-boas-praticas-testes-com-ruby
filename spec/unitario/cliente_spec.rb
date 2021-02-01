require_relative '../rspec_setup'

RSpec.describe Cliente do
  describe 'new' do
    subject { Cliente.new(parametros) }

    context 'Quando não é informado data de nascimento' do
      let(:id) { 101 }
      let(:nome) { 'Nome do cliente' }
      let(:parametros) { { id: id, nome: nome } }
      
      it 'retorna objeto da classe cliente com data de nascimento nula' do
        expect(subject.class).to be Cliente
        expect(subject.id).to eq id
        expect(subject.nome).to eq nome
        expect(subject.data_nascimento).to be_nil
      end
    end

    context 'Quando é informado data de nascimento nula' do
      let(:id) { 102 }
      let(:nome) { 'Nome do cliente' }
      let(:data_nascimento) { nil }
      let(:parametros) { { id: id, nome: nome, data_nascimento: data_nascimento } }
      
      it 'retorna objeto da classe cliente com data de nascimento nula' do
        expect(subject.class).to be Cliente
        expect(subject.id).to eq id
        expect(subject.nome).to eq nome
        expect(subject.data_nascimento).to eq data_nascimento
      end
    end

    context 'Quando é informado data de nascimento com vazia' do
      let(:id) { 103 }
      let(:nome) { 'Nome do cliente' }
      let(:data_nascimento) { '  ' }
      let(:parametros) { { id: id, nome: nome, data_nascimento: data_nascimento } }
      
      it 'retorna objeto da classe cliente com data de nascimento nula' do
        expect(subject.class).to be Cliente
        expect(subject.id).to eq id
        expect(subject.nome).to eq nome
        expect(subject.data_nascimento).to be_nil
      end
    end

    context 'Quando é informado data de nascimento com preenchida' do
      let(:id) { 104 }
      let(:nome) { 'Nome do cliente' }
      let(:data_nascimento) { '02-07-1987' }
      let(:parametros) { { id: id, nome: nome, data_nascimento: data_nascimento } }
      
      it 'retorna objeto da classe cliente com data de nascimento nula' do
        expect(subject.class).to be Cliente
        expect(subject.id).to eq id
        expect(subject.nome).to eq nome
        expect(subject.data_nascimento).to eq Date.parse(data_nascimento)
      end
    end
  end
end
