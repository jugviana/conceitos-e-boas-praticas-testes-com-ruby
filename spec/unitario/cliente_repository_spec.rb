require_relative '../rspec_setup'

RSpec.describe ClienteRepository do
  describe 'criar' do
    subject { ClienteRepository.criar(parametros) }

    context 'Quando um cliente é criado com sucesso' do
      let(:cliente_id) { 101 }
      let(:cliente_nome) { 'Nome do cliente criado com sucesso' }
      let(:cliente_data_nascimento) { '02/04/1990' }
      let(:cliente) { double(:cliente, id: cliente_id, nome: cliente_nome, data_nascimento: Date.parse(cliente_data_nascimento)) }
      let(:parametros) { { id: cliente_id, nome: cliente_nome, data_nascimento: cliente_data_nascimento } }

      it 'retorna objeto com dados do Cliente' do
        expect(Cliente).to receive(:new).with(parametros).and_return(cliente)
        expect(subject.id).to eq cliente_id
        expect(subject.nome).to eq cliente_nome
        expect(subject.data_nascimento).to eq  Date.parse(cliente_data_nascimento)
      end
    end

    context 'Quando ocorre erro ao criar cliente' do
      let(:cliente_id) { 102 }
      let(:cliente_nome) { 'Nome do cliente com erro ao criar' }
      let(:cliente_data_nascimento) { '02/04/1990' }
      let(:parametros) { { id: cliente_id, nome: cliente_nome, data_nascimento: cliente_data_nascimento } }

      it 'retorna objeto da model Cliente' do
        expect(Cliente).to receive(:new).with(parametros).and_raise(StandardError)
        expect{subject}.to raise_error(RuntimeError, 'Erro ao criar cliente')
      end
    end
  end
end
