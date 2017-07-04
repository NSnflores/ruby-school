require 'active_record'

# CREATE DATABASE  rubyschool;
# CREATE TABLE usuarios (
#    id SERIAL NOT NULL PRIMARY KEY,
#    nombre TEXT NOT NULL DEFAULT '',
#    apellidos TEXT NOT NULL DEFAULT ''
#);

# Change the following to reflect your database settings
ActiveRecord::Base.establish_connection(
  adapter:  'postgresql', # or 'postgresql' or 'sqlite3' or 'oracle_enhanced'
  host:     'localhost',
  database: 'rubyschool',
  username: 'dan',
  password: ''
)

class Usuario < ActiveRecord::Base
    alias_attribute :perro, :nombre
end 