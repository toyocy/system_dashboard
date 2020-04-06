class AddReferencesSystem < ActiveRecord::Migration[5.2]
  def change
    add_reference :systems, :team, null: false, foreign_key: true
  end
end
