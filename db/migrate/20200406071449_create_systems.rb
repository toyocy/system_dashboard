class CreateSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :systems do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
