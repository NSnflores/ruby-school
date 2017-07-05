class AgregarReferenciaDePersonaAProductos < ActiveRecord::Migration[5.1]
  def change
    add_reference :productos, :persona, foreign_key: true
  end
end
