class CreateEvent < ActiveRecord::Migration[7.1]
  def change
    create_table :events, id: :uuid do |t|
      t.string :name, default: '', null: false
      t.string :description
      t.integer :status, null: false
      t.datetime :open_time
      t.datetime :close_time
      t.references :gym, type: :uuid, foreign_key: { on_delete: :cascade }
      t.references :user, type: :uuid, foreign_key: { to_table: :users, on_delete: :cascade }
      t.timestamps
    end
  end
end
