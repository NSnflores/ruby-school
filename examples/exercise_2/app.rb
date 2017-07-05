require 'active_record'
require 'pg'
load 'models/persona.rb'
load 'models/producto.rb'

ActiveRecord::Base.configurations = YAML::load(IO.read('db/config.yml'))
ActiveRecord::Base.establish_connection(:development)

persona = Persona.new(nombre: 'Andrei', fecha_de_nacimiento: '1985-06-26')
persona.save
