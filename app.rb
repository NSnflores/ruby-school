require 'active_record'

# Modifica lo siguiente acorde a tus credenciales
ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  host:     'localhost',
  database: 'rubyschool',
  username: 'dan',
  password: ''
)

class Usuario < ActiveRecord::Base

end 