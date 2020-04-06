class CreateServers < ActiveRecord::Migration[5.2]
  def change
    create_table :servers do |t|
      t.string :hostname, null: false
      t.string :url
      t.text :description
      t.references :system, foreign_key: true

      t.timestamps
    end
  end
end
