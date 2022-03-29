class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :nombre
      t.string :rif
      t.string :celular
      t.string :email
      t.references :City, null: false, foreign_key: true

      t.timestamps
    end
  end
end
