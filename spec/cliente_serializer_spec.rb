require 'simplecov'
SimpleCov.start
require_relative '../app/model/cliente.rb'
require_relative '../app/serializers/cliente_serializer.rb'
require_relative '../app/repositories/cliente_repository.rb'
require_relative '../app/validators/cliente_validator.rb'
require_relative '../app/controllers/cliente_controller.rb'

RSpec.describe ClienteSerializer do
  subject { ClienteSerializer.serializar(cliente) }

  context 'Quando há data de nascimento informada' do
    context 'e cliente maior de idade' do
      let(:cliente) { double(:cliente, id: 1, nome: 'Cliente maior de idade', data_nascimento: Date.parse('01-01-1980')) }
      let(:idade) { ( Date.today - cliente.data_nascimento ) / 365.0 }
      let(:retorno_esperado) { { codigo: cliente.id, nome: cliente.nome, idade: idade, maior_de_idade: true } }

      it 'retorna cliente serializado' do
        expect(subject).to eq retorno_esperado
      end
    end

    context 'e cliente menor de idade' do
      let(:cliente) { double(:cliente, id: 1, nome: 'Cliente menor de idade', data_nascimento: data_nascimento) }
      let(:data_nascimento) { Date.today - 30 }
      let(:idade) { ( Date.today - cliente.data_nascimento ) / 365.0 }
      let(:retorno_esperado) { { codigo: cliente.id, nome: cliente.nome, idade: idade, maior_de_idade: false } }

      it 'retorna cliente serializado' do
        expect(subject).to eq retorno_esperado
      end
    end
  end

  context 'Quando não há data de nascimento informada' do
    let(:cliente) { double(:cliente, id: 1, nome: 'Cliente menor de idade', data_nascimento: nil) }
    let(:retorno_esperado) { { codigo: cliente.id, nome: cliente.nome, idade: nil, maior_de_idade: nil } }

    it 'retorna cliente serializado' do
      expect(subject).to eq retorno_esperado
    end
  end
end
