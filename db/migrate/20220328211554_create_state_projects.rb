class CreateStateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :state_projects do |t|
      t.datetime :fecha_transicion
      t.references :State, null: false, foreign_key: true
      t.references :Project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
