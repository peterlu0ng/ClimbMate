class CreateRelationships < ActiveRecord::Migration[7.1]
  def change
    create_table :relationships, id: :uuid do |t|
      t.references :user_a, type: :uuid, null: false, foreign_key: { to_table: :users }
      t.references :user_b, type: :uuid, null: false, foreign_key: { to_table: :users }
      t.integer :status, null: false
    end
    add_index :relationships, %i[user_a_id user_b_id], unique: true
  end
end
