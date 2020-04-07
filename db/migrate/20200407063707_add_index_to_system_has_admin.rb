class AddIndexToSystemHasAdmin < ActiveRecord::Migration[5.2]
  def change
    add_index :system_has_admins, [:system_id, :admin_id], unique: true
  end
end
