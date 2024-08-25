class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name, null: false
      t.string :email, default: '', null: false
      t.string :username, null: false
      t.string :encrypted_password, default: '', null: false
      t.timestamps
    end
  end
end
