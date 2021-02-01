require 'date'

class Cliente
  attr_reader :id, :nome, :data_nascimento

  def initialize(parametros)
    puts 'Criando objeto cliente'
    @id = parametros[:id]
    @nome = parametros[:nome]
    nascimento_preenchido = parametros[:data_nascimento] && parametros[:data_nascimento].strip.length > 0
    @data_nascimento = nascimento_preenchido ? Date.parse(parametros[:data_nascimento]) : nil
  end
end
