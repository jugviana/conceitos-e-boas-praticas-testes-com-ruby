class ClienteValidator
  def self.criacao!(parametros)
    puts 'Validando parâmetros de criação do cliente'
    raise 'Código do cliente não informado' unless parametros.keys.include?(:id)
    raise 'Nome do cliente não informado' unless parametros.keys.include?(:nome)
    raise 'Código do cliente não é um inteiro' unless parametros[:id].is_a?(Integer)
    raise 'Código do cliente não é um texto' unless parametros[:nome].is_a?(String)
    { id: parametros[:id], nome: parametros[:nome], data_nascimento: parametros[:data_nascimento] }
  end
end
