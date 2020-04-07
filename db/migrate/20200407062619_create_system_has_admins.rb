class CreateSystemHasAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :system_has_admins do |t|
      t.references :system, foreign_key: true, index: true
      t.references :admin, foreign_key: { to_table: :users }, index: true, allow_nil: true

      t.timestamps
    end
  end
end
