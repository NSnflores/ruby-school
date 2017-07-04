class CrearPersonas < ActiveRecord::Migration[5.1]
  def change
    create_table :personas do |t|
      t.integer :numero_de_empleado
      t.string  :nombre
      t.date    :fecha_de_nacimiento
      t.string  :genero
      t.string  :apodo
      t.float   :ahorro,   default: 0
      t.integer :estatura, default: 0

      # Opcional
      t.timestamps
    end
  end
end
