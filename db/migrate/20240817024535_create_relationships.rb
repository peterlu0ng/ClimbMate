class CreateRelationships < ActiveRecord::Migration[7.1]
  def change
    create_enum :friendship_status, %w[Friends Blocked]
    create_table :relationships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: { to_table: :users }
      t.enum :friendship, enum_type: 'friendship_status', null: false
      t.timestamps
    end
    add_index :relationships, %i[user_id friend_id], unique: true
  end
end
