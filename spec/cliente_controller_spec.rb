require 'simplecov'
SimpleCov.start
require_relative '../app/model/cliente.rb'
require_relative '../app/serializers/cliente_serializer.rb'
require_relative '../app/repositories/cliente_repository.rb'
require_relative '../app/validators/cliente_validator.rb'
require_relative '../app/controllers/cliente_controller.rb'

RSpec.describe ClienteController do
  subject { ClienteController.criar(parametros) }

  context 'Quando o teste é de Integração' do
    context 'e cliente é criado com sucesso' do
      context 'e data de nascimento é informada' do
        let(:parametros) { { id: cliente_id, nome: cliente_nome, data_nascimento: cliente_data_nascimento } }
        let(:cliente_id) { 1 }
        let(:cliente_nome) { 'Teste de Integração para a criação de cliente' }
        let(:cliente_data_nascimento) { '01-01-1980' }
        let(:idade) { ( Date.today - Date.parse(cliente_data_nascimento) ) / 365.0 }
        let(:retorno_esperado) { { http_status: 201, response_body: cliente_serializado } }
        let(:maior_de_idade) { idade >= 18 }
        let(:cliente_serializado) { { codigo: cliente_id, nome: cliente_nome, idade: idade, maior_de_idade: maior_de_idade } }

        it 'passa por todas as chamadas feitas pela ClienteController' do
          expect(subject).to eq retorno_esperado
        end
      end

      context 'e data de nascimento não é informada' do
        let(:parametros) { { id: cliente_id, nome: cliente_nome } }
        let(:cliente_id) { 1 }
        let(:cliente_nome) { 'Teste de Integração para a criação de cliente' }
        let(:retorno_esperado) { { http_status: 201, response_body: cliente_serializado } }
        let(:cliente_serializado) { { codigo: cliente_id, nome: cliente_nome, idade: nil, maior_de_idade: nil } }

        it 'passa por todas as chamadas feitas pela ClienteController' do
          expect(subject).to eq retorno_esperado
        end
      end
    end

    context 'e cliente tem erro nos dados' do
      let(:parametros) { { id: 1 } }
      let(:mensagem_erro) { 'Nome do cliente não informado' }
      let(:retorno_esperado) { { http_status: 500, response_body: mensagem_erro } }

      it 'passa por todas as chamadas feitas pela ClienteController' do
        expect(subject).to eq retorno_esperado
      end
    end
  end

  context 'Quando o teste é unitário' do
    let(:cliente_id) { 1 }
    let(:cliente_nome) { 'Teste unitário para a criação de cliente' }

    context 'e não ocorre erros de validação' do
      let(:parametros) { { id: cliente_id, nome: cliente_nome } }
      let(:retorno_esperado) { { http_status: 201, response_body: { codigo: cliente_id, nome: cliente_nome } } }
      # let(:cliente) { Cliente.new(parametros_validado) }
      let(:cliente) { double(:cliente, id: cliente_id, nome: cliente_nome) }
      let(:parametros_validado) { { id: cliente_id, nome: cliente_nome } }
      let(:cliente_serializado) { { codigo: cliente_id, nome: cliente_nome } }

      it 'mocka todas as chamadas feitas pela ClienteController' do
        expect(ClienteValidator).to receive(:criacao!).with(parametros).and_return(parametros_validado)
        expect(ClienteRepository).to receive(:criar).with(parametros_validado).and_return(cliente)
        expect(ClienteSerializer).to receive(:serializar).with(cliente).and_return(cliente_serializado)
        expect(subject).to eq retorno_esperado
      end
    end

    context 'e ocorre erro de validação' do
      let(:parametros) { { id: cliente_id, nome: cliente_nome } }
      let(:mensagem_erro) { 'Erro de validação' }
      let(:retorno_esperado) { { http_status: 500, response_body: mensagem_erro } }

      it 'mocka todas as chamadas feitas pela ClienteController' do
        expect(ClienteValidator).to receive(:criacao!).and_raise(StandardError, mensagem_erro)
        expect(ClienteRepository).not_to receive(:criar)
        expect(ClienteSerializer).not_to receive(:serializar)
        expect(subject).to eq retorno_esperado
      end
    end
  end
end