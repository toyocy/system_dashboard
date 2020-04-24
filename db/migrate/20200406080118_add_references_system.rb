class AddReferencesSystem < ActiveRecord::Migration[5.2]
  def change
    add_reference :systems, :team, foreign_key: true, allow_nil: true
  end
end
