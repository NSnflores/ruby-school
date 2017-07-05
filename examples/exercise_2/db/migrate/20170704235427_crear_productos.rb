class CrearProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :productos do |t|
      t.integer :numero_de_producto
      t.string  :descripción

      # Opcional
      t.timestamps
    end
  end
end
