class Persona < ActiveRecord::Base
 validates :genero, presence: true

  def saludar
    puts "Hola, mi nombre es #{nombre}, mucho gusto!"
  end

  # Esto es un getter. Podríamos haberlo implementado como un attr_reader, pero
  # queremos darle un tratamiento especial por lo que lo hacemos por nuestra
  # cuenta.
  def nombre
    read_attribute(:nombre).upcase
  end

  # Esto es un atributo virtual.
  def edad
    hoy = Date.today
    hoy.year - fecha_de_nacimiento.year -
    ((hoy.month > fecha_de_nacimiento.month ||
    (hoy.month == fecha_de_nacimiento.month && hoy.day >= fecha_de_nacimiento.day)) ? 0 : 1)
  end

  def obtener_paga(sueldo)
    self.ahorro += sueldo
  end
end
