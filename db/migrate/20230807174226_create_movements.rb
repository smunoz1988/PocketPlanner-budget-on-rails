class CreateMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :movements do |t|
      t.string :name
      t.integer :amount
      t.references :author, null: false, foreign_key: { to_table: :users, column: :author_id }
      t.references :group, null: false, foreign_key: { to_table: :groups, column: :group_id }
      t.timestamps
    end
  end
end
