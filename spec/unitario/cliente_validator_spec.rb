require_relative '../rspec_setup'

RSpec.describe ClienteValidator do
  subject { ClienteValidator.criacao!(parametros) }

  context 'Quando há erros na validação' do
    context 'e código do cliente não informado' do
      let(:parametros) { { nome: 'Nome do cliente' } }

      it 'dispara erro do tipo RuntimeError e sua mensagem' do
        expect{subject}.to raise_error(RuntimeError, 'Código do cliente não informado')
      end
    end

    context 'e nome do cliente não informado' do
      let(:parametros) { { id: 1 } }

      it 'dispara erro do tipo RuntimeError e sua mensagem' do
        expect{subject}.to raise_error(RuntimeError, 'Nome do cliente não informado')
      end
    end

    context 'e código do cliente não é do tipo Integer' do
      let(:parametros) { { id: '1', nome: 'Nome do cliente' } }

      it 'dispara erro do tipo RuntimeError e sua mensagem' do
        expect{subject}.to raise_error(RuntimeError, 'Código do cliente não é um inteiro')
      end
    end

    context 'e nome do cliente não é do tipo String' do
      let(:parametros) { { id: 1, nome: 123 } }

      it 'dispara erro do tipo RuntimeError e sua mensagem' do
        expect{subject}.to raise_error(RuntimeError, 'Código do cliente não é um texto')
      end
    end
  end

  context 'Quando não há erros na ṽalidação' do
    let(:parametros) { { id: 1, nome: 'Nome do cliente', data_nascimento: nil, campo_nao_autorizado: 'não autorizo' } }
    let(:retorno_esperado) { { id: parametros[:id], nome: parametros[:nome], data_nascimento: parametros[:data_nascimento] } }

    it 'retorna hash com os dados e valores válidos' do
      expect(subject).to eq retorno_esperado
    end
  end
end
