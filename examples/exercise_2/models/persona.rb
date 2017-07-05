class Persona < ActiveRecord::Base
  has_many :productos

  validates :nombre, format: { with: /\A[a-zA-Z]+\z/ }, unless: :es_un_enano?
  validates :genero, presence: true
  validate  :fecha_de_nacimiento_no_puede_ser_en_el_futuro

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

  def es_un_enano?
    estatura < 120
  end

  private

  def fecha_de_nacimiento_no_puede_ser_en_el_futuro
    if fecha_de_nacimiento.present? && fecha_de_nacimiento < Date.today
      errors.add(:fecha_de_nacimiento, 'a menos de que seas un viajero del tiempo no puede ser en el futuro...')
    end
  end
end
