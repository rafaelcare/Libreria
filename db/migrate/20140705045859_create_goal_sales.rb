class CreateGoalSales < ActiveRecord::Migration
  def change
    create_table :goal_sales do |t|
      t.integer :usuario_id
      t.integer :meta
      t.boolean :alcanzado
      t.datetime :fechainicio
      t.datetime :fechafin

      t.timestamps
    end
  end
end
