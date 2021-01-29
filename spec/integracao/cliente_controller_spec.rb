require_relative '../rspec_setup'

RSpec.describe ClienteController do
  describe 'criar' do
    subject { ClienteController.criar(parametros) }

    context 'Quando cliente é criado com sucesso' do
      context 'e data de nascimento é informada' do
        let(:cliente_id) { 101 }
        let(:cliente_nome) { 'Nome do Cliente para teste de integração' }
        let(:cliente_data_nascimento) { '01-01-1980' }
        let(:parametros) { { id: cliente_id, nome: cliente_nome, data_nascimento: cliente_data_nascimento } }
        let(:idade) { ( Date.today - Date.parse(cliente_data_nascimento) ) / 365.0 }
        let(:maior_de_idade) { idade >= 18 }
        let(:cliente_serializado) { { codigo: cliente_id, nome: cliente_nome, idade: idade, maior_de_idade: maior_de_idade } }
        let(:retorno_esperado) { { http_status: 201, response_body: cliente_serializado } }

        it 'passa por todas as chamadas feitas pela ClienteController e retorna Hash de sucesso' do
          expect(subject).to eq retorno_esperado
        end
      end

      context 'e data de nascimento não é informada' do
        let(:cliente_id) { 102 }
        let(:cliente_nome) { 'Nome do Cliente para teste de integração' }
        let(:parametros) { { id: cliente_id, nome: cliente_nome } }
        let(:cliente_serializado) { { codigo: cliente_id, nome: cliente_nome, idade: nil, maior_de_idade: nil } }
        let(:retorno_esperado) { { http_status: 201, response_body: cliente_serializado } }

        it 'passa por todas as chamadas feitas pela ClienteController e retorna Hash de sucesso' do
          expect(subject).to eq retorno_esperado
        end
      end
    end

    context 'Quando ocorre erro' do
      let(:parametros) { { id: 103 } }
      let(:mensagem_erro) { 'Nome do cliente não informado' }
      let(:retorno_esperado) { { http_status: 500, response_body: mensagem_erro } }

      it 'passa por todas as chamadas feitas pela ClienteController e retorna Hash de erro' do
        expect(subject).to eq retorno_esperado
      end
    end
  end
end