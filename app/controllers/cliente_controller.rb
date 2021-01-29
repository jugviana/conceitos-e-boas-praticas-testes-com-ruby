class ClienteController
  def self.criar(parametros)
    begin
      parametros_validos = ClienteValidator.criacao!(parametros)
      cliente = ClienteRepository.criar(parametros_validos)
      cliente_serializado = ClienteSerializer.serializar(cliente)
      { http_status: 201, response_body: cliente_serializado }
    rescue => erro
      { http_status: 500, response_body: erro.message }
    end
  end
end
