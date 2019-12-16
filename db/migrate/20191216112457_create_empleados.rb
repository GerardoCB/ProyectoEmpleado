class CreateEmpleados < ActiveRecord::Migration[6.0]
  def change
    create_table :empleados do |t|
      t.string :strnombre
      t.string :strapellidopaterno
      t.string :strapellidomaterno
      t.date :dtefechanacimiento
    end
  end
end
