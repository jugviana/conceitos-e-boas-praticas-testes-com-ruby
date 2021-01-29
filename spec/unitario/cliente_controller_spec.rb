require_relative '../rspec_setup'

RSpec.describe ClienteController do
  describe 'criar' do
    subject { ClienteController.criar(parametros) }

    context 'Quando cliente é criado com sucesso' do
      let(:cliente_id) { 101 }
      let(:cliente_nome) { 'Nome do Cliente para teste unitário' }
      let(:parametros) { { id: cliente_id, nome: cliente_nome } }
      let(:parametros_validos) { { id: cliente_id, nome: cliente_nome } }
      let(:cliente) { double(:cliente, id: cliente_id, nome: cliente_nome) }
      let(:cliente_serializado) { { codigo: cliente_id, nome: cliente_nome } }
      let(:retorno_esperado) { { http_status: 201, response_body: { codigo: cliente_id, nome: cliente_nome } } }

      it 'mocka todas as chamadas feitas pela ClienteController e retorna Hash de sucesso' do
        expect(ClienteValidator).to receive(:criacao!).with(parametros).and_return(parametros_validos)
        expect(ClienteRepository).to receive(:criar).with(parametros_validos).and_return(cliente)
        expect(ClienteSerializer).to receive(:serializar).with(cliente).and_return(cliente_serializado)
        expect(subject).to eq retorno_esperado
      end
    end

    context 'Quando ocorre erro' do
      let(:cliente_id) { 102 }
      let(:cliente_nome) { 'Nome do Cliente para teste unitário' }
      let(:parametros) { { id: cliente_id, nome: cliente_nome } }
      let(:mensagem_erro) { 'Erro de validação' }
      let(:retorno_esperado) { { http_status: 500, response_body: mensagem_erro } }

      it 'mocka todas as chamadas feitas pela ClienteController e retorna Hash de erro' do
        expect(ClienteValidator).to receive(:criacao!).and_raise(StandardError, mensagem_erro)
        expect(ClienteRepository).not_to receive(:criar)
        expect(ClienteSerializer).not_to receive(:serializar)
        expect(subject).to eq retorno_esperado
      end
    end
  end
end
