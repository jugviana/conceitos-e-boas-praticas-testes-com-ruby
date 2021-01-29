require_relative '../rspec_setup'

RSpec.describe ClienteSerializer do
  subject { ClienteSerializer.serializar(cliente) }

  context 'Quando data de nascimento é informada' do
    context 'e cliente é maior de idade' do
      let(:cliente_id) { 101 }
      let(:cliente_nome) { 'Nome do Cliente maior de idade' }
      let(:cliente_data_nascimento) { Date.parse('01-01-1980') }
      let(:quantidade_dias_do_ano) { 365.0 }
      let(:cliente) { double(:cliente, id: cliente_id, nome: cliente_nome, data_nascimento: cliente_data_nascimento) }
      let(:idade) { ( Date.today - cliente_data_nascimento ) / quantidade_dias_do_ano }
      let(:retorno_esperado) { { codigo: cliente_id, nome: cliente_nome, idade: idade, maior_de_idade: true } }

      it 'retorna cliente serializado' do
        expect(subject).to eq retorno_esperado
      end
    end

    context 'e cliente é menor de idade' do
      let(:cliente_id) { 102 }
      let(:cliente_nome) { 'Nome do Cliente menor de idade' }
      let(:cliente_data_nascimento) { Date.today - 30 }
      let(:quantidade_dias_do_ano) { 365.0 }
      let(:cliente) { double(:cliente, id: cliente_id, nome: cliente_nome, data_nascimento: cliente_data_nascimento) }
      let(:idade) { ( Date.today - cliente_data_nascimento ) / quantidade_dias_do_ano }
      let(:retorno_esperado) { { codigo: cliente_id, nome: cliente_nome, idade: idade, maior_de_idade: false } }

      it 'retorna cliente serializado' do
        expect(subject).to eq retorno_esperado
      end
    end
  end

  context 'Quando data de nascimento não informada' do
    let(:cliente_id) { 103 }
    let(:cliente_nome) { 'Nome do Cliente sem idade' }
    let(:cliente_data_nascimento) { nil }
    let(:cliente) { double(:cliente, id: cliente_id, nome: cliente_nome, data_nascimento: cliente_data_nascimento) }
    let(:retorno_esperado) { { codigo: cliente_id, nome: cliente_nome, idade: nil, maior_de_idade: nil } }

    it 'retorna cliente serializado' do
      expect(subject).to eq retorno_esperado
    end
  end
end
