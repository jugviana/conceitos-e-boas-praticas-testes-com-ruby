require 'simplecov'
SimpleCov.start
require_relative '../app/model/cliente.rb'
require_relative '../app/serializers/cliente_serializer.rb'
require_relative '../app/repositories/cliente_repository.rb'
require_relative '../app/validators/cliente_validator.rb'
require_relative '../app/controllers/cliente_controller.rb'

RSpec.describe ClienteValidator do
  subject { ClienteValidator.criacao!(parametros) }

  context 'Quando há erros na validação' do
    context 'e código do cliente não informado' do
      let(:parametros) { { nome: 'Nome do cliente' } }

      it 'dispara RuntimeError' do
        expect{subject}.to raise_error(RuntimeError, 'Código do cliente não informado')
      end
    end

    context 'e nome do cliente não informado' do
      let(:parametros) { { id: 1 } }

      it 'dispara RuntimeError' do
        expect{subject}.to raise_error(RuntimeError, 'Nome do cliente não informado')
      end
    end

    context 'e código do cliente não é um Inteiro' do
      let(:parametros) { { id: '1', nome: 'Nome do cliente' } }

      it 'dispara RuntimeError' do
        expect{subject}.to raise_error(RuntimeError, 'Código do cliente não é um inteiro')
      end
    end

    context 'e nome do cliente não é um Texto' do
      let(:parametros) { { id: 1, nome: 123 } }

      it 'dispara RuntimeError' do
        expect{subject}.to raise_error(RuntimeError, 'Código do cliente não é um texto')
      end
    end
  end

  context 'Quando não há erros na ṽalidação' do
    let(:parametros) { { id: 1, nome: 'Nome do cliente', data_nascimento: nil } }
    let(:retorno_esperado) { { id: parametros[:id], nome: parametros[:nome], data_nascimento: parametros[:data_nascimento] } }

    it 'retorna hash com os dados válidos' do
      expect(subject).to eq retorno_esperado
    end
  end
end
