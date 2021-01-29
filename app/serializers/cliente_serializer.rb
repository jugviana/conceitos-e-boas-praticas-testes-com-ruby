class ClienteSerializer
  def self.serializar(cliente)
    puts 'Serializando cliente'

    idade = obter_idade(cliente.data_nascimento)
    maior_de_idade = idade >= 18 if idade

    { codigo: cliente.id, nome: cliente.nome, idade: idade, maior_de_idade: maior_de_idade }
  end

  def self.obter_idade(data_nascimento)
    return unless data_nascimento
    hoje = Date.today
    (hoje - data_nascimento) / 365.0
  end
end
