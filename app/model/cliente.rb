require 'date'

class Cliente
  attr_reader :id, :nome, :data_nascimento

  def initialize(parametros)
    puts 'Criando objeto cliente'
    @id = parametros[:id]
    @nome = parametros[:nome]
    @data_nascimento = parametros[:data_nascimento] ? Date.parse(parametros[:data_nascimento]) : nil
  end
end
