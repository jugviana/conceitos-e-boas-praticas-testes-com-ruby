class ClienteRepository
  def self.criar(parametros)
    puts 'Criando cliente na base de dados'

    begin
      Cliente.new(parametros)
    rescue => erro
      raise RuntimeError, 'Erro ao criar cliente'
    end
  end
end
