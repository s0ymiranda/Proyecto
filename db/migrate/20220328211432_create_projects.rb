class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :nombre
      t.string :codigo
      t.date :fecha
      t.float :monto
      t.text :descripcion
      t.references :State, null: false, foreign_key: true
      t.references :Client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
