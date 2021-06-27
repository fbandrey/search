class CreateProcedures < ActiveRecord::Migration[6.1]
  def change
    create_table :procedures do |t|
      t.text :title, null: false
      t.datetime :created_at, null: false
    end
  end
end
