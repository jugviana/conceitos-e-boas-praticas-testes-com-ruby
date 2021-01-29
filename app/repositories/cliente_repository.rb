class ClienteRepository
  def self.criar(parametros)
    puts 'Criando cliente na base de dados'
    Cliente.new(parametros)
  end
end
