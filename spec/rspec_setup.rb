require 'simplecov'
SimpleCov.start
require_relative '../app/models/cliente.rb'
require_relative '../app/serializers/cliente_serializer.rb'
require_relative '../app/repositories/cliente_repository.rb'
require_relative '../app/validators/cliente_validator.rb'
require_relative '../app/controllers/cliente_controller.rb'
