class AddRelationToMovements < ActiveRecord::Migration[7.0]
  def change
    add_reference :movements, :group, null: false, foreign_key: { to_table: :groups, column: :group_id }
  end
end
