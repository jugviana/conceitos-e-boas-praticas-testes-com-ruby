require_relative '../rspec_setup'

RSpec.describe ClienteRepository do
  describe 'criar' do
    subject { ClienteRepository.criar(parametros) }

    context 'Quando um cliente é criado com sucesso' do
      let(:cliente_id) { 101 }
      let(:cliente_nome) { 'Nome do cliente criado com sucesso' }
      let(:cliente_data_nascimento) { '02/04/1990' }
      let(:parametros) { { id: cliente_id, nome: cliente_nome, data_nascimento: cliente_data_nascimento } }

      it 'retorna objeto da classe Cliente' do
        expect(subject.class).to be Cliente
        expect(subject.id).to eq cliente_id
        expect(subject.nome).to eq cliente_nome
        expect(subject.data_nascimento).to eq  Date.parse(cliente_data_nascimento)
      end
    end

    context 'Quando ocorre erro ao criar cliente' do
      let(:cliente_id) { 102 }
      let(:cliente_nome) { 'Nome do cliente com erro ao criar' }
      let(:cliente_data_nascimento) { 'data-com-formato-invalido' }
      let(:parametros) { { id: cliente_id, nome: cliente_nome, data_nascimento: cliente_data_nascimento } }

      it 'retorna objeto da model Cliente' do
        expect{subject}.to raise_error(RuntimeError, 'Erro ao criar cliente')
      end
    end
  end
end
